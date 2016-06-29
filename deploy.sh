#!/bin/bash

server=myDO

read -r -d '' command <<EOF
    eval "\$(ssh-agent -s)"
    ssh-add ~/.ssh/github
    cd /home/albert/Projects/wechatPlat
    git pull origin master
    git
    sudo service nginx restart
EOF

#echo $command
ssh -t $server "$command"