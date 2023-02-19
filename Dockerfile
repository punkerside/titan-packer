FROM alpine:3.17.0

RUN apk update && apk upgrade && apk add --no-cache \
  curl \
  jq \
  aws-cli \
  ansible \
  bash && \
  rm /var/cache/apk/*

RUN curl -o packer_1.8.4_linux_amd64.zip https://releases.hashicorp.com/packer/1.8.4/packer_1.8.4_linux_amd64.zip && \
  unzip packer_1.8.4_linux_amd64.zip && \
  mv packer /usr/bin/packer && \
  chmod +x /usr/bin/packer


COPY init.sh /usr/bin/init.sh
WORKDIR /app
ENTRYPOINT [ "/usr/bin/init.sh" ]