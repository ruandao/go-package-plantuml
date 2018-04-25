# go-package-plantuml


### 环境配置

1.安装go环境并配置环境变量
````ftl>
export GOROOT=/opt/golang/go
export PATH=$GOROOT/bin:$PATH
export GOPATH=/opt/gopath
````
2.安装JDK8以上并配置环境变量
````ftl>
export JAVA_HOME=/opt/jdk/jdk1.8.0_161
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
````
在/etc/profile文件中加入对应的环境变量，并刷新source /etc/profile

### 安装所需软件 
````ftl>
yum install graphviz
yum install git
yum install wget
````

### 下载和编译项目
````
go get github.com/maobuji/go-package-plantuml
````

### 编译和下载依赖包
首次运行会自动下载依赖包，请耐心等待。
````
cd /opt
cp $GOPATH/src/github.com/maobuji/go-package-plantuml/goplantuml . -rf
cd goplantuml
chmod 775 *.sh
sh install.sh
````


# 使用命令直接运行
直接运行，可以设置更多参数。--codedir为必须输入，其它参数可选
````
./go-package-plantuml --codedir /appdev/gopath/src/github.com/contiv/netplugin \
--gopath /appdev/gopath \
--outputfile  /tmp/result.txt
--ignoredir /appdev/gopath/src/github.com/contiv/netplugin/vendor
````
参数说明<br>
--codedir 要分析的代码目录<br>
--gopath GOPATH环境变量目录<br>
--outputfile 分析结果保存到该文件<br>
--ignoredir 不需要进行代码分析的目录（可以不用设置）<br>


将上一步的输出文本，转换为svg文件
````
java -jar plantuml.jar /tmp/result.txt -tsvg
````

gouml脚本中有样例，可以直接sh gouml.sh运行