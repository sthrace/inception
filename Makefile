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
	@sudo rm -rf /home/sthrace/data/wp
	@sudo rm -rf /home/sthrace/data/db
	# @docker stop $$(docker ps -qa)
	# @docker rm $$(docker ps -qa)
	@docker rmi $$(docker images -q)
	@docker volume rm $$(docker volume ls -q)
	# @docker network rm $$(docker network ls -q)
	

prune:
	@docker system prune -a -f

start:
	@mkdir -p /home/sthrace/data/wp
	@mkdir -p /home/sthrace/data/db
	@cd ./srcs && docker-compose up --build -d

stop:
	@cd ./srcs && docker-compose down	

host:
	@echo '127.0.0.1 sthrace.42.fr' >> /etc/hosts 
	@echo '127.0.0.1 www.sthrace.42.fr' >> /etc/hosts 

git:
	@git add *
	@git commit -m "commit"
	@git push

.SILENT:
.PHONY: git stop start clear docker utils re prune
