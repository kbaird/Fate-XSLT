Fate-XSLT
=========

Character
[DTD](http://www.w3.org/TR/xhtml1/dtds.html)s for
[Evil Hat Productions](http://evilhat.com/)'
[Fate Core](http://www.evilhat.com/home/fate-core/) &amp;
[Fate Accelerated](http://www.evilhat.com/home/fae/) (FAE) RPGs, along with
[XSLT](http://www.w3.org/TR/xslt) sheets for rendering to various output formats.

Very much in progress.

Store character files in characters, and execute via

    ./publish.sh some_character_file.xml

Output (currently just HTML) is rendered into the `out` directory.
Validation is also available:

    ./validate.sh some_character_file.xml

Other useful URLs:
- http://www.faterpg.com/
- http://fate-srd.com/

I develop on a Lubuntu 13.10 system with `xmllint` and `xsltproc` executables available.
