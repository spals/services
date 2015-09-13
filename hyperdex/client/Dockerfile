#
# Hyperdex client image
#
FROM spals/hyperdex-base

RUN apt-get install -y python python-hyperdex-admin python-hyperdex-client
RUN mkdir /hyperdex-client

COPY init_hyperdex_client.py /hyperdex-client/init_hyperdex_client.py

# Start the interactive python interpreter and
# and run the init_hyperdex_client script
CMD ["python", "-i", "/hyperdex-client/init_hyperdex_client.py"]

