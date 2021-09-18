FROM       tensorflow/tensorflow:latest

EXPOSE     8888:8888

WORKDIR    /app
COPY       packages.txt /app/

RUN        apt update && apt-get update
RUN        apt upgrade -y && apt-get upgrade -y
RUN        apt autoremove -y && apt-get autoremove -y
RUN        apt install apt-utils gcc g++ make git nano curl sudo -y

RUN        curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN        apt-get install nodejs -y

RUN        curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
RUN        echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN        sudo apt-get update && sudo apt-get install yarn -y

RUN        /usr/bin/python3 -m pip install --upgrade pip
RUN        pip install -r packages.txt
RUN        rm packages.txt

RUN        jupyter-lab --generate-config -y
RUN        echo "c.ServerApp.password = 'sha1:6febfe84e0a3:fd373f757af9c9bf5a2d0919bad5fb6f0564da08'" >>/root/.jupyter/jupyter_notebook_config.py

#RUN        jupyter labextension install @jupyterlab/google-drive
RUN        jupyter labextension install @yeebc/jupyterlab_neon_theme
RUN        jupyter labextension install jupyterlab-theme-solarized-dark
RUN        pip install jupyterlab-horizon-theme
RUN        pip install --upgrade jupyterlab jupyterlab-git
#RUN        jupyter lab build


CMD        ["jupyter","lab","--no-browser","--ip=0.0.0.0","--allow-root"]


# Edit theme default here:     /usr/local/share/jupyter/lab/schemas/@jupyterlab/apputils-extension/themes.json
