FROM node:13

ENV PATH $PATH:/node_modules/.bin


COPY ["package.json", "yarn.lock", "./"]
        #科大源 
RUN yarn add  global hexo-cli \
    && git config  --global user.name "wuchuheng" \
    && git config  --global user.email "root@wuchuheng.com" \
    && mkdir /hexo &&  cd /hexo \
    && mv /package.json /yarn.lock ./ \
    && yarn install ;

##切换到hexo目录
WORKDIR /hexo

#启用4000端口
EXPOSE 4000

#启动hexo服务
ENTRYPOINT ["hexo", "server", "--debug"]

