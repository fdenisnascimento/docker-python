# Docker for Python server

### Prerequisites

Create a EC2 default  with docker server running
	
	https://aws.amazon.com/
	
Case don't have a docker running
	
	curl -sSL https://get.docker.com/ | sh
	usermod -aG docker ec2-user
	
	*Is need reboot the system.*
	
	
### Migrating

* **Create entrypoint.sh**
	
		#!/bin/bash		
		/var/www/run_production.sh
	

* **Create DockerFile**
	
		FROM debian:jessie
		MAINTAINER Denis Nascimento <denis@thssolution.com>
		
		RUN apt-get update -y 
		RUN apt-get install -y git unzip python-pip python-setuptools libpq-dev python-dev build-essential libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev   

		
		RUN mkdir /var/www/
		RUN chmod +x /var/www/
		COPY /www/ /var/www/
		
		
		# Add entrypoint for start splunk 
		ADD entrypoint.sh /bin/entrypoint.sh
		
		# Set permissions for execute entrypoint.sh
		RUN chmod +x /bin/entrypoint.sh
		
		RUN pip install -r ../var/www/requirements.txt
		
		ENTRYPOINT ["entrypoint.sh"]
		
	
* **Build docker with DockerFile**	
	
		docker build -t company:service .
		
		
* **Run a container docker**		

		docker run --name service -d -p 8080:8080 m4u:fota
		
## Authors

* **Denis Nascimento** 


