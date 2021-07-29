#!/bin/bash

set -e

VERSION=$1

docker build . -f "Dockerfile" -t "xgb_tests_${VERSION}" --build-arg VERSION="${VERSION}"
