#!/bin/sh

wget http://nlp.stanford.edu/software/stanford-ner-2015-12-09.zip
wget http://nlp.stanford.edu/software/stanford-german-2015-10-14-models.jar
wget http://nlp.stanford.edu/software/stanford-spanish-corenlp-2015-10-14-models.jar
wget http://nlp.stanford.edu/software/stanford-chinese-corenlp-2015-12-08-models.jar

unzip stanford-ner-2015-12-09.zip
rm -f stanford-ner-2015-12-09.zip
cp -r stanford-ner-2015-12-09/* .
rm -rf stanford-ner-2015-12-09

unzip -o stanford-german-2015-10-14-models.jar
unzip -o stanford-spanish-corenlp-2015-10-14-models.jar
unzip -o stanford-chinese-corenlp-2015-12-08-models.jar
unzip -o stanford-ner-3.6.0.jar
cp lib/slf4j-api.jar .
cp lib/slf4j-simple.jar .
unzip -o slf4j-api.jar
unzip -o slf4j-simple.jar

mkdir -p service/impl
mkdir -p service/endp

sh make.sh
