#!/bin/bash

base_dir=`pwd`;
tidb_src_path="/opt/gopath/src/github.com/pingcap/tidb"

cd ..

packagelist=("ast" "cmd" "config")
for package_name in ${packagelist[@]}; do
    out_file_name=$package_name.txt
    ./go-package-plantuml --codedir $base_dir/$package_name --outputfile $out_file_name
    echo "java -jar plantuml.jar $out_file -tsvg"
    java -jar plantuml.jar $out_file -tsvg
done

mv *.svg $base_dir
rm *.txt -rf



