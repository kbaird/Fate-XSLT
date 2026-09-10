#!/usr/bin/env python3
"""Static checks over the xslt/ include graph and character stylesheet PIs.

Covered checks:
  2. every include/import target resolves
  3. no module reachable twice through xsl:include from any entry point
  4. unreachable modules are reported
  5. every character xml-stylesheet target exists

Prints one line per violation and exits nonzero if any are found.
Usage: check-stylesheets.py [repo-root]   (defaults to the current directory)
"""

import os
import re
import sys

root = os.path.abspath(sys.argv[1]) if len(sys.argv) > 1 else os.getcwd()
errors = []


def rel(path):
    return os.path.relpath(path, root)


def find_stylesheets():
    found = []
    for dirpath, _dirs, names in os.walk(os.path.join(root, "xslt")):
        for name in names:
            if name.endswith(".xsl"):
                found.append(os.path.join(dirpath, name))
    return sorted(found)


stylesheets = find_stylesheets()
stylesheet_set = set(stylesheets)


def targets_for(pattern, text, stylesheet):
    targets = []
    for match in pattern.finditer(text):
        target = os.path.normpath(
            os.path.join(os.path.dirname(stylesheet), match.group(1)))
        if target not in stylesheet_set:
            errors.append("missing include/import target: %s -> %s"
                          % (rel(stylesheet), match.group(1)))
        else:
            targets.append(target)
    return targets


include_re = re.compile(r'<xsl:include\b[^>]*href="([^"]+)"')
import_re = re.compile(r'<xsl:import\b[^>]*href="([^"]+)"')

includes = {}
imports = {}
for stylesheet in stylesheets:
    text = open(stylesheet, encoding="utf-8", errors="replace").read()
    includes[stylesheet] = targets_for(include_re, text, stylesheet)
    imports[stylesheet] = targets_for(import_re, text, stylesheet)

entries = sorted(os.path.join(root, "xslt", name)
                 for name in os.listdir(os.path.join(root, "xslt"))
                 if name.endswith(".xsl"))

# No module is reachable twice through xsl:include from any entry point.
for entry in entries:
    visits = {}
    stack = [entry]
    while stack:
        node = stack.pop()
        visits[node] = visits.get(node, 0) + 1
        if visits[node] > 1:
            errors.append("module included more than once from %s: %s"
                          % (rel(entry), rel(node)))
            continue
        stack.extend(includes[node])

# Unreachable modules are reported (include and import edges).
reachable = set()
stack = list(entries)
while stack:
    node = stack.pop()
    if node in reachable:
        continue
    reachable.add(node)
    stack.extend(includes[node])
    stack.extend(imports[node])
for stylesheet in stylesheets:
    if stylesheet not in reachable:
        errors.append("unreachable stylesheet: %s" % rel(stylesheet))

# Every character xml-stylesheet target exists.
pi_re = re.compile(r'<\?xml-stylesheet\b[^>]*href="([^"]+)"')
for dirpath, _dirs, names in os.walk(os.path.join(root, "characters")):
    for name in sorted(names):
        if not name.endswith(".xml"):
            continue
        character = os.path.join(dirpath, name)
        text = open(character, encoding="utf-8", errors="replace").read()
        match = pi_re.search(text)
        if match is None:
            errors.append("character without xml-stylesheet PI: %s"
                          % rel(character))
            continue
        target = os.path.normpath(os.path.join(dirpath, match.group(1)))
        if not os.path.exists(target):
            errors.append("character points at missing stylesheet: %s -> %s"
                          % (rel(character), match.group(1)))

for error in errors:
    print(error)
sys.exit(1 if errors else 0)
