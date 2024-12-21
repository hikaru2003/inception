all:
	docker compose -f srcs/docker-compose.yml up --build -d

build:
	docker compose -f srcs/docker-compose.yml build

up:
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker compose -f srcs/docker-compose.yml down --rmi all -v

# volumeのパスを指定しているので、環境によっては変更が必要
fclean:
	docker compose -f srcs/docker-compose.yml down --rmi all -v \
	&& rm -rf /Users/hikaru/Desktop/42Tokyo/inception/srcs/requirements/wordpress/volume/* /Users/hikaru/Desktop/42Tokyo/inception/srcs/requirements/wordpress/mariadb/*
ps:
	docker compose -f srcs/docker-compose.yml ps

prune:
	docker system prune --volumes

logs:
	docker compose -f srcs/docker-compose.yml logs

.PHONY: all build up down clean fclean ps prune logs