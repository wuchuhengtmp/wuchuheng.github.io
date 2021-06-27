#!/bin/s
# function substr() {
#     # echo $dir;
#     # str=$1;
#     # dir=/home/www/myproject/hexo/public
#     str=$1;
#     echo $str ${#str} 
# }
# dir=`pwd`/public;
# find `pwd`/public  -exec echo {} \; > tmp.log
# while read line
# do
#     ftp_path=${line#*$dir};
#     if [[ ${#ftp_path} -gt 0 ]]
#     then
#         ftp_path=(${ftp_path//\// }) 
#         if [[ -d $line ]]
#         then
#             base_dir=""
#             for loop in ${ftp_path[@]}
#             do
#                 has_space=(${loop// / }) 
#                 #  有空格目录进行转译 
#                 if [ "${loop/ /}" != "$loop" ]
#                 then
#                     loop=\'$loop\';
#                 fi
#                 base_dir=$base_dir"/"$loop
#                 echo "mkdir "$base_dir
#             done
#         fi
#         # echo ${ftp_path[*]}
#     fi
# done < tmp.log
apt update;
apt install ftp -y;
ftp -ivn <<EOF
    open jd.wuchuheng.com  21
    user wuchuheng.com wuchuheng.com
    binary
    lcd public
    put index.html /index.html
    put search.xml  /search.xml
    put CNAME /CNAME
    put hexo-admin-ehc-images.json /hexo-admin-ehc-images.json hexo
    quit
EOF

