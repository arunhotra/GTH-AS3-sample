FROM alpine:3.10

ENV ANSIBLE_VERSION=2.9.2

LABEL org.opencontainers.image.authors=$BUILD_SIGNATURE \
    org.opencontainers.image.source="https://github.com/arunhotra/GTH-AS3-sample" \
    org.opencontainers.image.created=$BUILD_DATE \
    org.opencontainers.image.build_number=$BUILD_NUMBER \
    org.opencontainers.image.commit=$GIT_COMMIT \
    org.opencontainers.image.title="arunhotra/GTH-AS3-sample" \
    org.opencontainers.image.description="Sample for generating AS3 from csv" \
    org.opencontainers.image.version=$BUILD_VERSION \
    org.zdocker.compose=$COMPOSE 

RUN set -xe \
    && echo "****** Install system dependencies ******" \
    && apk add --no-cache --progress python3 openssl \
    ca-certificates git openssh sshpass \
    && apk --update add --virtual build-dependencies \
    python3-dev libffi-dev openssl-dev build-base \
    \
    && echo "****** Install ansible and python dependencies ******" \
    && pip3 install --upgrade pip \
    && pip3 install ansible==${ANSIBLE_VERSION} boto3 \
    \
    && echo "****** Remove unused system librabies ******" \
    && apk del build-dependencies \
    && rm -rf /var/cache/apk/* 

RUN set -xe \
    && mkdir -p /etc/ansible \
    && echo -e "[local]\nlocalhost ansible_connection=local" > \
    /etc/ansible/hosts

COPY . /ansible/playbooks

WORKDIR /ansible/playbooks

CMD [ "sh" ]
