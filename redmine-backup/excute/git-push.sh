#!/bin/sh

expect -c " 
    set timeout -1  
    spawn bash -c \"cd WORKING_DIR; git push origin BRANCH_NAME\"

    expect Username*
    send -- \"TomonoriMatsumura\n\"

    expect Password*
    send -- \"GITHUB_PASSWORD\n\"
    
    expect eof
    exit
    "
