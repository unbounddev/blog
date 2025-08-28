# sudo docker build -t hugo .
sudo docker run --rm -it -v .:/site -p 1313:1313 hugo