.DEFAULT_GOAL := run
.PHONY : run init dc-up clean help

run: init dc-up

init:
	@echo "XAUTH=$(shell xauth list)" > .env

dc-up:
	@docker-compose up --build -d 1> /dev/null && docker exec -it DockerVScode code --no-sandbox --user-data-dir=/home

clean:
	@docker-compose down && rm -rf ./.env

help:
	@echo -e "\e[1;33mmake:\u001b[0m\n\tFor running this project"
	@echo -e "\e[1;33mclean:\u001b[0m\n\tExaclty run docker-compose down then remove env file"
	@echo -e "\e[1;33minit:\u001b[0m\n\tCreate projects requirement"
	@echo -e "\e[1;33mdc-up:\u001b[0m\n\tThis is literally run docker-compse up then run VScode using dokcer exec in its container"
