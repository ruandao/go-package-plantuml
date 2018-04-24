#!/bin/bash

./go-package-plantuml --codedir /opt/gopath/src/github.com/pingcap/tidb/session --outputfile session.txt
echo "java -jar plantuml session.txt -tsvg"
java -jar plantuml session.txt -tsvg



