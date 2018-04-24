#!/bin/bash

out_file=session.txt
./go-package-plantuml --codedir /opt/gopath/src/github.com/pingcap/tidb/session --outputfile $out_file
echo "java -jar plantuml.jar $out_file -tsvg"
java -jar plantuml.jar $out_file -tsvg



