#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define variables
WORKING_DIR="./Terraform"  # Adjust this to your Terraform configuration directory if needed

echo "Starting Terraform Workflow..."

# Step 1: Format Terraform files
echo "Running 'terraform fmt' to format configuration files..."
terraform -chdir=$WORKING_DIR fmt -recursive
echo "'terraform fmt' completed."

# Step 2: Initialize the Terraform working directory
echo "Running 'terraform init' to initialize the working directory..."
terraform -chdir=$WORKING_DIR init -input=false
echo "'terraform init' completed."

# Step 3: Validate the configuration (Optional but recommended)
echo "Validating Terraform configuration..."
terraform -chdir=$WORKING_DIR validate
echo "'terraform validate' completed successfully."

# Step 4: Plan the infrastructure changes (Optional but recommended for review)
echo "Creating an execution plan with 'terraform plan'..."
terraform -chdir=$WORKING_DIR plan -out=tfplan
echo "Execution plan created: 'tfplan'."

# Step 5: Apply the changes
echo "Applying the changes with 'terraform apply'..."
terraform -chdir=$WORKING_DIR apply -auto-approve tfplan
echo "'terraform apply' completed. Infrastructure changes applied successfully."

# Cleanup the plan file (Optional)
rm -f $WORKING_DIR/tfplan

echo "Terraform Workflow Completed!"