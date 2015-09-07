#
# Hyperdex daemon image
#
FROM spals/hyperdex-base

RUN apt-get install -y hyperdex-daemon
RUN mkdir /hyperdex /logs

COPY start-hyperdex-daemon.sh /hyperdex/start-hyperdex-daemon.sh

EXPOSE 2012

VOLUME /data

CMD ["bash", "/hyperdex/start-hyperdex-daemon.sh"]
