#!/bin/bash

set -eo pipefail

# Set up term colors
green='\033[1;32m'
red='\033[0;31m'
white='\033[1;37m'
yellow='\033[1;33m'
NC='\033[0m' # No Color

BUNDLE="bundle"
MIDDLEMAN="middleman"

if ! which ${BUNDLE} > /dev/null; then \
  echo -e "${red} ${BUNDLE} not installed, please install Bundler (http://bundler.io) ${NC}"
  exit 1; \
fi

echo -e "${white}Building static docs...${NC}"
${BUNDLE} install && ${BUNDLE} exec ${MIDDLEMAN} build
echo -e "${green}Built pay-tech static files...${NC}"
