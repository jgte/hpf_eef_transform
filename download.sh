#!/bin/bash -ue

DIR_HERE=$(cd $(dirname $BASH_SOURCE);pwd)
FILE_EXTRACTOR=hpf_eef_transform
URL_EXTRACTOR="https://earth.esa.int/eogateway/documents/20142/975278/L1b-L2-XML-parser-hpf_eef_transform_1.2.1.zip"
FILE_TESTEXTR=xml_parser_test_suite
URL_TESTEXTR="https://earth.esa.int/eogateway/documents/20142/975278/xml-parser-test-suite-v0.4.zip"

#make sure XML parser is available, and download it if not
[ -e $DIR_HERE/$FILE_EXTRACTOR.zip ] || curl -L -J -o $DIR_HERE/$FILE_EXTRACTOR.zip $URL_EXTRACTOR
[ -d $DIR_HERE/$FILE_EXTRACTOR     ] || mkdir -p $DIR_HERE/$FILE_EXTRACTOR
unzip -n $DIR_HERE/$FILE_EXTRACTOR.zip -d $DIR_HERE/$FILE_EXTRACTOR
echo "File extractor available at $DIR_HERE/$FILE_EXTRACTOR"
#get test parser suite
[ -e $DIR_HERE/$FILE_TESTEXTR.zip ]  || curl -L -J -o $DIR_HERE/$FILE_TESTEXTR.zip $URL_TESTEXTR
[ -d $DIR_HERE/$FILE_TESTEXTR      ] || mkdir -p $DIR_HERE/$FILE_TESTEXTR
unzip -n $DIR_HERE/$FILE_TESTEXTR.zip -d $DIR_HERE/$FILE_TESTEXTR
tar --keep-newer-files --directory=$DIR_HERE/$FILE_TESTEXTR -xpf $DIR_HERE/$FILE_TESTEXTR/$FILE_TESTEXTR*.tgz || true
echo "Test suite available at $DIR_HERE/$FILE_TESTEXTR"