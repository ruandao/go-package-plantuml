#!/bin/bash

if [ ! -n "$GOPATH" ]; then
  echo "GOPATH IS NULL"
  exit 0
else
  echo "GOPATH="$GOPATH
fi

rm go-package-plantuml -rf
go build github.com/maobuji/go-package-plantuml

if [ -f "plantuml.jar" ]
then
   echo "plantuml.jar exist"
else
   wget https://jaist.dl.sourceforge.net/project/plantuml/plantuml.jar
fi


code_dir=`cat config.properties|grep "code_dir"|cut -d"=" -f2`
out_file=`cat config.properties|grep "out_file"|cut -d"=" -f2`

./go-package-plantuml --codedir $code_dir --outputfile $out_file

echo "java -jar plantuml.jar $out_file -tsvg"
java -jar plantuml.jar $out_file -tsvg



