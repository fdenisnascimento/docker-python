	FROM debian:jessie
  MAINTAINER Denis Nascimento <denis@thssolution.com>

  RUN apt-get update -y 
  RUN apt-get install -y git unzip python-pip python-setuptools libpq-dev python-dev build-essential libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev   


  RUN mkdir /var/www/
  RUN chmod +x /var/www/
  COPY /www/ /var/www/


  # Add entrypoint for start python 
  ADD entrypoint.sh /bin/entrypoint.sh

  # Set permissions for execute entrypoint.sh
  RUN chmod +x /bin/entrypoint.sh

  RUN pip install -r ../var/www/requirements.txt

  ENTRYPOINT ["entrypoint.sh"]
