docker:
		rm -rf ~/.docker
		rm -rf ~/.minikube
		rm -rf ~/goinfre/sthrace/.docker
		rm -rf ~/goinfre/sthrace/.minikube
		brew reinstall docker
		mkdir ~/.docker
		mv ~/.docker ~/goinfre/sthrace/
		ln -s ~/goinfre/sthrace/.docker ~/.docker
dm:
		docker-machine create --driver virtualbox default
		# eval $$(docker-machine env default) --> not functional
		# docker-compose up --> line for future
start:
		RUN ./srcs/requirements/nginx/docker build -t nginx .