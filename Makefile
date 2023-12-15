
all: configs up

configs:
	@ sudo mkdir -p /home/elpastor/data/db_data
	@ sudo mkdir -p /home/elpastor/data/wp_data
	@ sudo grep "elpastor.42.fr" /etc/hosts || sudo sh -c 'echo "127.0.0.1 elpastor.42.fr" >> /etc/hosts'

up:
	docker-compose -f srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all

fclean: clean
	docker system prune --all --volumes --force
	sudo rm -rf /home/elpastor/data

re: fclean all

.PHONY: all clean fclean re configs