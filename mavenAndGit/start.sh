
cd /user/src/

readonly folder=$1
if [ -n "${folder}"];
then
	echo_error 没有传入文件夹名称
	
fi

readonly git=$2
if [ -n "${git}"];
then
	echo_error 没有传入git地址
	
fi

readonly branch=$3
if [ -n "${branch}"];
then
	echo_error 分支名称
	
fi

readonly appFloader=$4
if [ -n "${appFloader}"];
then
	echo_error 没有传入应用文件夹名称
	
fi

if [ ! -d "${folder}" ]; then

git clone --branch ${branch} ${git}

fi

cd ${folder}

git pull

mvn -Dmaven.test.skip=true install

cd ${appFloader}

mvn -Dmaven.test.skip=true spring-boot:run