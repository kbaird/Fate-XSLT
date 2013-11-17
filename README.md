Fate-XSLT
=========

Character
[DTD](http://www.w3.org/TR/xhtml1/dtds.html)s for
[Evil Hat Productions](http://evilhat.com/)'
[Fate Core](http://www.evilhat.com/home/fate-core/),
[Fate Accelerated](http://www.evilhat.com/home/fae/) (FAE) &amp;
[Diaspora](http://www.vsca.ca/Diaspora/) RPGs, along with
[XSLT](http://www.w3.org/TR/xslt) sheets for rendering to various output formats.

Store character files in the `characters` directory, and execute via

    ./publish.sh some_character_file.xml

which depends on a default XSL stylesheet being defined in the given XML document.
The sample characters demonstrate this.

Output (currently just HTML) is rendered into the `out` directory.
Validation is also available:

    ./validate.sh some_file.dtd some_character_file.xml other_character_file.xml

Other useful URLs:
- http://www.faterpg.com/
- http://fate-srd.com/

I develop on a Lubuntu 13.10 system with `xmllint` and `xsltproc` executables
available. Those assumptions are reflected in the stock versions of the publish
executables for now.
