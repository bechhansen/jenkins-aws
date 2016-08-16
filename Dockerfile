FROM jenkins

USER root

RUN echo 'deb http://http.debian.net/debian wheezy-backports main' > /etc/apt/sources.list.d/backports.list && \
	apt-get update && \
	apt-get -y install apt-transport-https ca-certificates && \
	apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
	echo 'deb https://apt.dockerproject.org/repo debian-jessie main' > /etc/apt/sources.list.d/docker.list && \
	apt-get update && \
	apt-get -y install docker-engine





RUN curl https://s3.amazonaws.com/aws-cli/awscli-bundle.zip -o "awscli-bundle.zip"

RUN unzip awscli-bundle.zip && \
	./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws  && \
	rm awscli-bundle.zip

USER jenkins 

RUN mkdir /var/jenkins_home/.aws