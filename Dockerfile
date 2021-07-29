FROM ubuntu:20.04
ARG AWS_REGION=us-east-1
ARG VERSION

RUN sed -i "s/archive.ubuntu.com/${AWS_REGION}.ec2.archive.ubuntu.com/g" /etc/apt/sources.list
RUN apt-get update -y && apt-get -y install software-properties-common && apt-add-repository -y ppa:deadsnakes && apt-get update -y && apt-get install -y python3.7 python3.7-dev python3-pip && ln -sf /usr/bin/python3.7 /usr/bin/python3
RUN apt-get update -y
RUN apt-get upgrade -y && apt-get install -y less vim-tiny telnet libyajl2 libyajl-dev libyaml-dev && pip3 install --upgrade pip

COPY requirements_$VERSION.txt /copy/requirements.txt

RUN pip3 install -r /copy/requirements.txt

COPY data /opt/data
COPY main.py /opt

CMD ["python3", "-u", "/opt/main.py"]