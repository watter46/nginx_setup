FROM nginx:1.20

ARG GROUP_NAME=laravel
ARG GROUP_ID ${GROUP_ID}
ARG USER_NAME=laravel
ARG USER_ID ${USER_ID}

COPY ./nginx.conf /etc/nginx/nginx.conf

RUN groupadd -g $GROUP_ID $GROUP_NAME && \
       useradd -m -s /bin/bash -u $USER_ID -g $GROUP_ID $USER_NAME && \
       touch /var/run/nginx.pid && \
       chown -R $USER_NAME:$GROUP_NAME /var/run/nginx.pid && \
       chown -R $USER_NAME:$GROUP_NAME /var/cache/nginx

# コンテナを実行するユーザーを指定
USER $USER_NAME

CMD ["nginx"]
