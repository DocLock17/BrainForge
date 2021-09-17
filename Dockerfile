FROM       tensorflow/tensorflow:latest

EXPOSE     8888:8888

WORKDIR    /app
COPY       requirements.txt /app/
RUN        apt update && apt-get update
RUN        apt upgrade -y && apt-get upgrade -y
RUN        apt install curl sudo -y
RUN        pip install -r packages.txt
RUN        curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN        apt-get install nodejs -y
#RUN       apt install node.js -y
RUN        jupyter-lab --generate-config -y
RUN        echo "c.ServerApp.password = 'sha1:6febfe84e0a3:fd373f757af9c9bf5a2d0919bad5fb6f0564da08'" >>/root/.jupyter/jupyter_notebook_config.py
RUN        jupyter labextension install @yeebc/jupyterlab_neon_theme

CMD        ["jupyter","lab","--no-browser","--ip=0.0.0.0","--allow-root"]

