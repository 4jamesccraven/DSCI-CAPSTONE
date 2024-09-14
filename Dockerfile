FROM tensorflow/tensorflow:latest

COPY ./requirements.txt .
RUN pip install -r requirements.txt

RUN useradd -ms /bin/bash dev
COPY ./.bashrc /home/dev

USER dev
WORKDIR /home/dev
