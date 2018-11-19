#!/bin/sh

readonly folder=$1
if [ -n "${folder}"];
then
	echo -e  没有传入文件夹名称 && exit
	
fi

readonly git=$2
if [ -n "${git}"];
then
	echo -e  没有传入git地址 && exit
	
fi

readonly branch=$3
if [ -n "${branch}"];
then
	echo -e  分支名称 && exit
	
fi

readonly appFloader=$4
if [ -n "${appFloader}"];
then
	echo -e  没有传入应用文件夹名称 && exit
	
fi

mvnOrder=$5
if [ -n "${mvnOrder}"];
then
	mvnOrder = -Dmaven.test.skip=true
else
    mvnOrder = mvnOrder + ' -Xmx512m -Dmaven.test.skip=true'

fi

if [ ! -d "${folder}" ]; 
then

git clone --branch ${branch} ${git}

fi

ls

# 删除自己的jar包
rm -rf /root/.m2/repository/com/dev999/*

cd ${folder}

git pull

mvn clean -Dmaven.test.skip=true install

cd ${appFloader}

mvn ${mvnOrder} spring-boot:run

