FROM node:0.10.38
MAINTAINER Nathan LeClaire <nathan@docker.com>

ADD . /app
WORKDIR /app
RUN npm install
RUN apt-get update
RUN apt-get install -y vim

ARG user=term
ARG pass=term
ENV user $user
ENV pass $pass

RUN useradd -d /home/$user -m -s /bin/bash $user
RUN echo '$user:$pass' | chpasswd

EXPOSE 3000

ENTRYPOINT ["node"]
CMD ["app.js", "-p", "3000"]
