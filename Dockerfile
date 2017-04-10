FROM ubuntu:latest

# ---
# ---
# ---

echo Build 1491838951

# ---
# ---
# ---

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget curl \
        unzip \
        git subversion \
        build-essential \
        python python-dev python-pip python-openssl \
        ruby ruby-dev \
        php-cli php-cgi php-mysql \
        openjdk-9-jre-headless \
        openssh-client \
        libkrb5-dev \
        golang && \
    apt-get clean

# ---
# ---
# ---

RUN (curl --location https://deb.nodesource.com/setup_6.x | bash -) && \
    (apt-get install -y --no-install-recommends nodejs)

# ---
# ---
# ---

ENV CLOUDSDK_PYTHON_SITEPACKAGES 1

RUN (echo "deb https://packages.cloud.google.com/apt cloud-sdk-$(lsb_release -c -s) main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list) && \
    (curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -) && \
    (apt-get update && apt-get install -y --no-install-recommends google-cloud-sdk google-cloud-sdk-app-engine-python google-cloud-sdk-app-engine-java)

# ---
# ---
# ---

RUN npm install -g grunt-cli \
                   cloudflare-cli \
                   wintersmith wintersmith-appengine wintersmith-less wintersmith-browserify

# ---
# ---
# ---

RUN pip install --upgrade pip
RUN pip install setuptools
RUN pip install awscli

# ---
# ---
# ---

WORKDIR /root/

# ---
