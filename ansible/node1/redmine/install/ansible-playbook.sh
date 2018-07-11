#!/bin/sh

expect -c "
    set timeout -1
    spawn bash -c \"ansible-playbook /WORKDIR/redmine_install.yml \
    --become-method=su \
    --ask-become-pass \
    -i "example.com:22," \
    -u ansible \
    -e "db_password=DBPASSWORD" \
    | tee /WORKDIR/.ansible.log\"

    expect SU*
    send -- \"SUPASSWORD\n\"

    expect eof
    exit
    "
