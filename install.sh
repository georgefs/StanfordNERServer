#!/bin/sh

wget http://nlp.stanford.edu/software/stanford-ner-2015-12-09.zip
wget http://nlp.stanford.edu/software/stanford-german-2015-10-14-models.jar
wget http://nlp.stanford.edu/software/stanford-spanish-corenlp-2015-10-14-models.jar
wget http://nlp.stanford.edu/software/stanford-chinese-corenlp-2015-12-08-models.jar

unzip stanford-ner-2015-12-09.zip
rm -f stanford-ner-2015-12-09.zip
mv stanford-ner-2015-12-09/lib lib
mv stanford-ner-2015-12-09/*.jar lib
rm -rf stanford-ner-2015-12-09

mv *.jar lib
./make.sh
