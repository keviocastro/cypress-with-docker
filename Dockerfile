FROM cypress/base:10

ENV DOCKERIZE_VERSION v0.6.1
ENV DOCKERIZE_FILE dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz 
RUN apt-get update && apt-get install -y curl \
    && curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
    && curl -L https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/$DOCKERIZE_FILE -o $DOCKERIZE_FILE \
    && tar -C /usr/local/bin -xzvf $DOCKERIZE_FILE \
    && rm $DOCKERIZE_FILE \
    && curl -fsSL https://get.docker.com -o get-docker.sh \
    && sh ./get-docker.sh \
    && rm ./get-docker.sh
