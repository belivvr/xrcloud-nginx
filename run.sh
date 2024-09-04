#!/bin/bash

# 실행 모드 확인
MODE=$1
HOME_DIR=$(pwd)


if [ "$MODE" == "prod" ]; then
    echo "Running in production mode..."
    # nginx home 위치는 현재 위치를 받아서 설정
    SSL_DIR="$HOME_DIR/ssl"
    NGINX_CONF="$HOME_DIR/nginx.conf"
else
    echo "Running in development mode..."
    # dev 모드에서 다른 디렉토리로 설정
    SSL_DIR="$HOME_DIR/ssl.dev"
    NGINX_CONF="$HOME_DIR/nginx.dev.conf"
fi

# 기존 nginx 서비스 중지
sudo systemctl stop nginx

# 기존 도커 컨테이너 중지 및 삭제
sudo docker stop xrcloud-nginx
sudo docker rm xrcloud-nginx

# 도커 이미지 빌드
sudo docker build -t xrcloud-nginx .

# 도커 컨테이너 실행
sudo docker run -d --name xrcloud-nginx --restart always --network xrcloud \
    -p 80:80 -p 443:443 \
    -v "$SSL_DIR:/etc/ssl" \
    -v "$NGINX_CONF:/etc/nginx/nginx.conf" \
    -v /app/xrcloud-backend/storage:/app/xrcloud-backend/storage \
    xrcloud-nginx:latest
