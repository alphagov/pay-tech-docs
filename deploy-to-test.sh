#!/bin/bash

set -eo pipefail

CF="cf"
CF_API_URL="api.cloud.service.gov.uk"
CF_SPACE="sandbox"
CF_ORG="govuk-pay"
APP_NAME="govukpay-docs-test"

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

echo -e "${white}Pushing application to CF...${NC}"
${CF} push ${APP_NAME}
echo -e "${green}Successful deploy CF...${NC}"
