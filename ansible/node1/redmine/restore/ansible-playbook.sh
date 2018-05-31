#!/bin/sh

expect -c " 
    set timeout -1  
    spawn bash -c \"ansible-playbook /WORKDIR/redmine_restore.yml \
    --become-method=su \
    --ask-become-pass \
    -i "example.com:22," \
    -u ansible \
    -e "db_password=DBPASSWORD" \
    -e "backup_data_host=BACKUPDATAHOST" \
    | tee /WORKDIR/.ansible.log\"
 
    expect SU*
    send -- \"SUPASSWORD\n\"
 
    expect eof
    exit
    "
