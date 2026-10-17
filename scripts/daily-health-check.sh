#!/bin/bash
echo "=== Gondal Foundation Daily Check $(date) ==="
aws sts get-caller-identity --query Account --output text
aws iam get-account-summary --query 'SummaryMap.Users'
aws s3 ls | wc -l
aws ec2 describe-instances --query 'Reservations[].Instances[].State.Name' --output text
aws budgets describe-budgets --account-id $(aws sts get-caller-identity --query Account --output text) --region us-east-1 --query 'Budgets[].BudgetName' --output text
echo "Check complete"
