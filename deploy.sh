#!/bin/bash

server=myDO

read -r -d '' command <<EOF
    eval "\$(ssh-agent -s)"
    ssh-add ~/.ssh/github
    cd /home/albert/Projects/wechatPlat
    git pull origin master
    sudo uwsgi --reload /var/run/wechat_uwsgi.pid
    sudo service nginx restart
EOF

#echo $command
ssh -t $server "$command"