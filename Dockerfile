        #基于debian 8.2
FROM    node:8.2.0
        # 安装hexo推送依赖git工具
RUN     apt-get upgrade -y  \
        && apt-get -y install git \
        #增加swap缓存 不然1G内存是生成不了静态文件的
        #&& dd if=/dev/zero of=/swapfile bs=1024 count=1024k \
        #&& mkswap /swapfile \
        #git用户名,如:
        && git config  --global user.name "wuchuheng" \
        #git用户email,如:
        && git config  --global user.email "wuchuheng@163.com" \
        # 淘宝npm镜像
        && npm install -g cnpm --registry=https://registry.npm.taobao.org \
        # 安装hexo命令行工具
        && cnpm install -g hexo-cli \
        #初始化hexo项目目录,置于/hexo
        && hexo init /hexo && cd /hexo \
        #根据自己喜好来安装插件,如:
        #git 插件用于推送到仓库,必备插件之一,
        && cnpm install hexo-deployer-git --save \
        #RRS功能插件
        && cnpm install hexo-generator-feed --save \
        #next主题本地搜索插件,查找资料很管用不用next主题的可以不用
        #安装next主题,如果不喜欢默认主题就选择自己喜欢的来安装
        #&& git clone https://github.com/theme-next/hexo-theme-next /hexo/themes/next \
        #next 本地搜索
        && cnpm install hexo-generator-searchdb --save \
        #a 标签nofollow 属性
        && cnpm install hexo-nofollow --save \
        # 加入admin后台 
        && cnpm install --save hexo-admin ;

#切换到hexo目录
WORKDIR /hexo

#启用4000端口
EXPOSE 4000

#启动hexo服务
ENTRYPOINT ["hexo", "server", "--debug"]

