FROM debian:buster

RUN apt-get update
RUN apt-get install -y nano git curl

RUN set -uex; \ 
    apt-get update; \
    apt-get install -y ca-certificates curl gnupg; \
    mkdir -p /etc/apt/keyrings; \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
    | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg; \
    NODE_MAJOR=18; \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" \
     > /etc/apt/sources.list.d/nodesource.list; \
    apt-get update; \
    apt-get install nodejs -y;

RUN npm install -g @angular/cli
RUN npm install -g ngx-i18nsupport

WORKDIR /home/node/app/

VOLUME ["/home/node/app/"]

COPY ./script/script.sh /scripts/script.sh

RUN chmod +x /scripts/script.sh

ENTRYPOINT ["/scripts/script.sh"]

# Make port 3000 available to the world outside this container
EXPOSE 3000