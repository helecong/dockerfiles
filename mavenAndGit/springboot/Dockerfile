FROM maven:3.5.4-jdk-8

RUN apt-get install -y git 
RUN mkdir -p /user/src/.ssh/

ARG git_user_name="he15669960120"
ARG git_user_email="hlc@wkhtm.com"

RUN git config --global user.name ${git_user_name}
RUN git config --global user.email ${git_user_email}

COPY ./start.sh /user/src/start.sh
RUN chmod 777 /user/src/start.sh
