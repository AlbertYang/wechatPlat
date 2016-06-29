#!/bin/bash

server=myDO

read -r -d '' command <<EOF
    cd /home/albert/Projects/wechatPlat
    git pull
    sudo uwsgi --ini wechat_uwsgi.ini
    sudo service nginx restart
EOF

ssh -t $server "command"