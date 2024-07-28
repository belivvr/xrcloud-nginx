sudo systemctl stop nginx
sudo docker stop xrcloud-nginx
sudo docker rm xrcloud-nginx
sudo docker build -t xrcloud-nginx .
sudo docker run -d --name xrcloud-nginx --restart always --network xrcloud -p 80:80 -p 443:443 -v /home/azureuser/xrcloud-nginx/ssl:/etc/ssl -v /home/azureuser/xrcloud-nginx/nginx.conf:/etc/nginx/nginx.conf -v /app/xrcloud-backend/storage:/app/xrcloud-backend/storage xrcloud-nginx:latest
