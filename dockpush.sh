#/bin/bash
set -ex
docker push tob123/adguard-staging:${VERSION}
if [[ -n $LATEST_MINOR ]]; then
  MAJOR_TAG=$(echo $VERSION | awk -F. {' print $1"."$2'})
  docker tag tob123/adguard-staging:${VERSION} tob123/adguard-staging:${MAJOR_TAG}
  docker push tob123/adguard-staging:${MAJOR_TAG}
fi
if [[ -n $LATEST ]]; then
  docker tag tob123/adguard-staging:${VERSION} tob123/adguard-staging:latest
  docker push tob123/adguard-staging:latest
fi
