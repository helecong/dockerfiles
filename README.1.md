# 说明
此镜像是为了方便java项目开发环境的更新。

# 使用Demo
    demo:
      image: helecong/maven_git:springboot
      privileged: true
      restart: always
      volumes:
        - /etc/localtime:/etc/localtime
        - /etc/timezone:/etc/timezone:ro
        - /root/.ssh/:/root/.ssh/
        - .maven/M2:/root/.m2
        - ./logs/:/home/logs/
      ports:
        - "8080:8080"
      entrypoint: /bin/sh -c "执行命令"


## maven 仓库地址
  /root/.m2

## git ssh文件地址
  /root/.ssh/

# 版本说明
- laster版
  
  只有maven和git

- springboot版

  基于laster，添加 启动springboot的脚本 start.sh 

  脚本位置：/user/src

  demo说明：./start.sh [项目文件夹（同git名称）] [git地址] [git分支名称] [需要启动的项目文件夹名称]