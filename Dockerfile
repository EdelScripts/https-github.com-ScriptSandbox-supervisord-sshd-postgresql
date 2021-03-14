FROM postgres:latest

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=admin
ENV POSTGRES_DB=test

RUN apt-get update && apt-get install -y supervisor openssh-server
RUN mkdir -p /var/run/sshd /var/log/supervisor

COPY script.sh /etc/supervisor/conf.d/script.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]