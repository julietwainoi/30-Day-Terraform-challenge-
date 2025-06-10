#!/bin/bash
# Usage: ./deploy.sh blue|green

ENV=$1

terraform apply -var="active_env=$ENV" -var-file="terraform.tfvars"
