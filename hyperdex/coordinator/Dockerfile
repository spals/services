#
# Hyperdex daemon image
#
FROM spals/hyperdex-base

RUN apt-get install -y hyperdex-coordinator

EXPOSE 1982

CMD ["hyperdex", "coordinator", "-f", "-p", "1982"]

