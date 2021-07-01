utils:
	@sudo apt-get -y update
	@sudo apt-get -y upgrade
	@sudo apt-get install curl
	@sudo apt-get install apt-transport-https
	@sudo apt-get install ca-certificates
	@sudo apt-get install software-properties-common

docker:
	@curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	@sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
	@sudo apt update
	@apt-cache policy docker-cesudo
	@sudo apt-get install docker-ce
	@sudo apt-get -y install pip
	@sudo pip install docker-compose
	@sudo usermod -aG docker $$(whoami)
	@su - $${USER}
	@id -nG

clear:
	@docker stop $$(docker ps -qa)
	@docker rm $$(docker ps -qa)
	@docker rmi $$(docker images -q)
	@docker volume rm $$(docker volume ls -q)
	@docker network rm $$(docker network ls -q)

prune:
	@docker system prune -a -f

start:
	@docker-compose -f srcs/docker-compose.yml up

stop:
	@docker-compose -f srcs/docker-compose.yml down

re:
	@docker-compose -f srcs/docker-compose.yml up --build -d

git:
	@git add *
	@git commit -m "commit"
	@git push

.SILENT:
.PHONY: git stop start clear docker utils re prune
