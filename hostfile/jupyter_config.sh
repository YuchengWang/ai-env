#!/bin/bash

# config jupyter
jupyter_config_file=~/.jupyter/jupyter_notebook_config.py

if [ ! -f ${jupyter_config_file} ]; then
    pip3 install jupyter
    IPAddr=`ifconfig eth0 | grep 'inet ' | awk '{print $2}'`
    #echo  "Current IP address for docker is ${IPAddr}"
    jupyter notebook --generate-config
    echo "c.NotebookApp.ip='${IPAddr}'" >> ${jupyter_config_file}
fi