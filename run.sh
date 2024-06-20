sudo docker stop xrcloud-nginx
sudo docker rm xrcloud-nginx
sudo docker build -t xrcloud-nginx .
sudo docker run -d --name xrcloud-nginx --network xrcloud -p 80:80 -p 443:443 -v /home/belivvr/xrcloud-nginx/ssl:/etc/ssl -v /home/belivvr/xrcloud-nginx/nginx.conf:/etc/nginx/nginx.conf -v /app/xrcloud-backend/storage:/app/xrcloud-backend/storage xrcloud-nginx:latest
