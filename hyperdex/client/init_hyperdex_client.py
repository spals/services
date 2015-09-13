#
# A python script to initialize the HyperDex client
#

import os
import hyperdex.admin
import hyperdex.client

# Get the HyperDex host name and port based on a docker link
# to the coordinator
host=str(os.environ['HYPERDEX_COORDINATOR_PORT_1982_TCP_ADDR'])
port=int(os.environ['HYPERDEX_COORDINATOR_PORT_1982_TCP_PORT'])

admin=hyperdex.admin.Admin(host, port)
client=hyperdex.client.Client(host, port)
