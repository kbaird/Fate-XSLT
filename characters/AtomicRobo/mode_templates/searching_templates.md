# Searching Mode Templates

Just use `grep` and `xargs`. For example, to find all mode templates that
provide the *Deceive* skill but do not provide the *Provoke* skill, execute

`grep -l Deceive *.template | xargs grep -L Provoke`


