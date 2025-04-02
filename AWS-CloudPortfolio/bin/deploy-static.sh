#!/bin/bash

STACK_NAME="StaticWebsiteStack"
TEMPLATE_FILE="CFN/static-website.yaml"
REGION="us-east-1"

aws cloudformation deploy \
  --template-file $TEMPLATE_FILE \
  --stack-name $STACK_NAME \
  --region $REGION \
  --capabilities CAPABILITY_IAM \
  --parameter-overrides \
  RootDomain=miguelguzmanprojectportfolio.com \
  WWWDomain=www.miguelguzmanprojectportfolio.com \
  SubDomain=projects.miguelguzmanprojectportfolio.com

echo "CloudFormation stack '$STACK_NAME' deployment completed."
