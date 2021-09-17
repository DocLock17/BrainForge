# BrainForge
The goal here is a docker build that lands between colab and sagemaker. When you own infra you should use it.



#### Installation?
sudo apt update && sudo apt-get update && sudo apt upgrade -y && sudo apt-get upgrade -y && sudo apt autoremvoe -y && sudo apt-get autoremove -y

sudo apt install python3-pip gdown

sudo groupadd docker && sudo usermod -a -G docker doclock17

git clone https://www.github.com/doclock17/BrainForge

cd BrainForge

docker image build --tag dtest:1.0 .

docker run -it --rm -p 8888:8888 dtest:1.0

ip address show

#Note: gdown https://drive.google.com/uc?id=1X2QmdTBVXesDka3ixjPVt15tuXAThgyo