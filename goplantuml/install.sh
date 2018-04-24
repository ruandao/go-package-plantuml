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





