# 베이스 이미지 설정
FROM nginx:latest

# nginx.conf 파일을 컨테이너 내로 복사
COPY nginx.conf /etc/nginx/nginx.conf

# 포트 설정
EXPOSE 80
EXPOSE 443
