#!/bin/bash

base_dir=`pwd`;
tidb_src_path="/opt/gopath/src/github.com/pingcap/tidb"
rm *.svg *.txt -rf

cd ..

packagelist=("ast" "cmd" "config" "ddl" "distsql" "domain" "executor" "expression" "infoschema" "kv" "meta" "metrics" "model" "mysql" "owner" "parser" "perfschema" "plan" "privilege" "server" "session" "sessionctx" "statistics" "store" "structure" "table" "tablecodec" "terror" "tidb-server" "types" "util" "x-server")

for package_name in ${packagelist[@]}; do
    out_file_name=$package_name.txt
    ./go-package-plantuml --codedir $tidb_src_path/$package_name --outputfile $out_file_name
    echo "java -jar plantuml.jar $out_file_name -tsvg"
    java -jar plantuml.jar $out_file_name -tsvg
    mv $package_name.txt $base_dir -f
    mv $package_name.svg $base_dir -f
done

cd $base_dir

echo "==========================uml-end============================================"

for package_name in ${packagelist[@]}; do
    if [ `grep -c "An error has occured" $base_dir/$package_name.svg` -eq '0' ]; then
         a=""
    else
         echo "$package_name package error"
    fi
done






