#!/bin/bash

export STACK_NAME="cft-demo-stack"
export AWS_PROFILE="saml"
export AWS_DEFAULT_REGION=ap-south-1 #Asia Pacific (Mumbai)

# [Note] Requires latest version of awscli >= 1.11.14. Run "pip install awscli --upgrade" if required.
aws cloudformation create-stack --stack-name "${STACK_NAME}" --template-body file://./cft-demo.template --capabilities CAPABILITY_NAMED_IAM
aws cloudformation wait stack-create-complete --stack-name "${STACK_NAME}"
aws cloudformation describe-stack-events --stack-name "${STACK_NAME}" --query StackEvents[*].[Timestamp,LogicalResourceId,ResourceType,ResourceStatus,ResourceStatusReason] --output=table

#aws cloudformation delete-stack --stack-name cft-demo-stack --profile saml --region ap-southeast-1
