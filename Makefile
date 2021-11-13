# build:
# 				docker build -t test .
# run:
# 				docker run --name test -d -p 80:80 test
# down:
# 				docker stop test && docker rm test && docker image rm test
# rm:
# 				docker image rm test
# ls:
# 				docker image ls
# ps:
# 				docker ps -a --no-trunc
# logs:
# 				docker logs test


# up:
# 				@make build
# 				@make run
# auto:
# 				@make down
# 				@make build
# 				@make run

build:
				docker compose build --no-cache --force-rm
ps:
				docker ps -a --no-trunc
up:
				@make build
				docker compose up -d
down:
				docker compose down
auto:
				@make down
				@make up
logs:
				docker compose logs
web:
				docker compose exec web bash
