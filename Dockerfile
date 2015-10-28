FROM ubuntu:trusty

RUN useradd -u 1001 nonpriv

RUN apt-get install -y software-properties-common
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
RUN add-apt-repository -y "deb http://dl.hhvm.com/ubuntu trusty-lts-3.9 main"
RUN apt-get update -y
RUN apt-get install -y hhvm ruby
RUN gem install prmd

ADD server.ini /etc/hhvm/server.ini
ADD php.ini /etc/hhvm/php.ini

VOLUME /var/lib/hhvm/sessions
VOLUME /var/www/html

USER nonpriv
CMD /usr/bin/hhvm --config /etc/hhvm/php.ini --config /etc/hhvm/server.ini --mode daemon -vPidFile=/var/run/hhvm/pid
