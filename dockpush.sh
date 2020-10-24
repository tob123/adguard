#/bin/bash
set -ex
docker push tob123/adguard-staging:${VERSION}
if [[ -n $LATEST ]]; then
  docker tag tob123/adguard-staging:${VERSION} tob123/adguard-staging:latest
  docker push tob123/piwigo-staging:latest
fi
