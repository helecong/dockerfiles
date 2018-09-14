@echo on
:: 切换为UTF-8输出模式
@chcp 65001
@echo 编写目的
@echo 自动化构建docker镜像，并推送到制定的进项仓库
@echo 同时制定版本号
@echo 推送完成后删除本地镜像
@echo=

@echo ----------------常量池------------------------

@SET ALIYUN_ACCOUNT=helecong
@echo 账号:%ALIYUN_ACCOUNT%
@SET repositoryURL=
@echo 仓库地址:%repositoryURL%
@SET imageName=helecong/maven_git
@echo 镜像名称:%imageName%
@SET version=springboot
@echo 镜像版本号:%version%
@SET dockerFile=Dockerfile
@echo Dockerfile:%dockerFile%
:: 本地镜像名称
@SET localImage=%imageName%:%version%
:: 阿里云镜像地址
@SET aliyunResPath=%imageName%:%version%

@echo ----------------常量池------------------------
@echo=

@echo 请确认以上信息是否正确
@pause>nul



@echo 开始构建镜像: %CD%\%dockerFile%

docker build -f %dockerFile% -t %localImage% .
@ IF "%ERRORLEVEL%" == "0" (ECHO 本地构建镜像成功) else (ECHO 本地构建镜像失败 && exit)

@echo 开始推送到阿里云镜像仓库: %aliyunResPath%

@echo 登录阿里云
docker login --username=%ALIYUN_ACCOUNT% 
@ IF "%ERRORLEVEL%" == "0" (ECHO 登录dockerhub成功) else (ECHO 登录dockerhub失败 && exit)

@echo 开始推送镜像
@ docker tag %localImage% %aliyunResPath%
@ IF "%ERRORLEVEL%" == "0" (ECHO 修改tag成功) else (ECHO 修改tag失败 && exit)
docker push %aliyunResPath%
@ IF "%ERRORLEVEL%" == "0" (ECHO 推送镜像完成) else (ECHO 推送镜像失败 && exit)
@echo 开始删除本地无用镜像
docker rmi %aliyunResPath% %localImage% $(docker images -q -f dangling=true)

@echo 清理完毕



