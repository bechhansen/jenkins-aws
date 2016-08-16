FROM jenkins

USER root

RUN curl https://s3.amazonaws.com/aws-cli/awscli-bundle.zip -o "awscli-bundle.zip"

RUN unzip awscli-bundle.zip && \
	./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws  && \
	rm awscli-bundle.zip

USER jenkins 

RUN mkdir /var/jenkins_home/.aws