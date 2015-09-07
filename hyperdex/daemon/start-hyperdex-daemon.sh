#!/bin/bash -x

# If a HyperDex coordinator container is linked with the alias `hyperdex-coordinator`, use it.
[ -n "${HYPERDEX_COORDINATOR_PORT_1982_TCP_ADDR}" ] && HYPERDEX_COORDINATOR_HOST=${HYPERDEX_COORDINATOR_PORT_1982_TCP_ADDR}
[ -n "${HYPERDEX_COORDINATOR_PORT_1982_TCP_PORT}" ] && HYPERDEX_COORDINATOR_PORT=${HYPERDEX_COORDINATOR_PORT_1982_TCP_PORT}

hyperdex daemon -f \
    --listen-port=2012 \
    --coordinator=${HYPERDEX_COORDINATOR_HOST} \
    --coordinator-port=${HYPERDEX_COORDINATOR_PORT} \
    --log=/logs \
    --data=/data
