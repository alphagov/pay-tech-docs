#!/bin/bash

set -eo pipefail

CF="cf"
CF_API_URL="api.cloud.service.gov.uk"
CF_SPACE="sandbox"
CF_ORG="govuk-pay"
APP_NAME="govukpay-docs"

# Set up term colors
green='\033[1;32m'
red='\033[0;31m'
white='\033[1;37m'
yellow='\033[1;33m'
NC='\033[0m' # No Color

if ! which ${CF} > /dev/null; then \
  echo -e "${red} ${CF} not installed, please install CloudFoundry CLI...${NC}"
  exit 1; \
fi

echo -e "${white}Installing virtualenv.${NC}"
virtualenv venv
. ./venv/bin/activate
./venv/bin/python ./venv/bin/pip install -qUr requirements.txt
echo -e "${green}Virtualenv installed...${NC}"

echo -e "${yellow}Getting CF API Pass${NC}"

credstash get paas.api_pass

echo -e "${green}Got PaaS CF API password...${NC}"
set +x
CF_API_PASS=$(credstash get paas.api_pass)
CF_API_USER=$(credstash get paas.api_user)
set -x

echo -e "${white}Logging into CF...${NC}"
${CF} login \
  -a ${CF_API_URL} \
  -u ${CF_API_USER} \
  -p ${CF_API_PASS} \
  -o ${CF_ORG} \
  -s ${CF_SPACE}
echo -e "${green}Successfully logged into CF...${NC}"
echo -e "${white}Pushing application to CF...${NC}"
${CF} push ${APP_NAME}
echo -e "${green}Successful deploy CF...${NC}"
