#!/bin/bash

set -eo pipefail

BUNDLE="bundle"
MIDDLEMAN="middleman"

if ! which ${BUNDLE} > /dev/null; then \
  echo -e "${red} ${BUNDLE} not installed, please install Bundler (http://bundler.io) ${NC}"
  exit 1; \
fi

if ! which ${MIDDLEMAN} > /dev/null; then \
  echo -e "${red} ${MIDDLEMAN} not installed, please install ${MIDDLEMAN} (https://middlemanapp.com/basics/install/) ${NC}"
  exit 1; \
fi

echo -e "${white}Building static docs...${NC}"
${BUNDLE} install && ${BUNDLE} exec ${MIDDLEMAN} build
echo -e "${green}Built pay-tech static files...${NC}"
