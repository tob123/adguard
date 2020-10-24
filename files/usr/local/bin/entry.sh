#!/bin/sh
if [[ ! -f ${ADGUARD_CONF} && -n ${ADGUARD_CONF} ]]; then
  cp /opt/AdGuardHome.yaml ${ADGUARD_CONF}
fi
exec "$@"
