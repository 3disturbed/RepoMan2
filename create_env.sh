#!/bin/bash

echo "Welcome to RepoMan2 Environment Setup Wizard"

# Prompt for GitHub repository URL
read -p "Enter the GitHub repository URL: " REPO
if [[ -z "$REPO" ]]; then
    echo "Error: Repository URL cannot be empty."
    exit 1
fi

# Prompt for admin email
read -p "Enter the admin email address (for notifications): " ADMIN_EMAIL
if [[ -z "$ADMIN_EMAIL" ]]; then
    echo "Error: Admin email cannot be empty."
    exit 1
fi

# Prompt for email user
read -p "Enter the email address for sending notifications: " EMAIL_USER
if [[ -z "$EMAIL_USER" ]]; then
    echo "Error: Email user cannot be empty."
    exit 1
fi

# Prompt for email password
read -s -p "Enter the password for the email user: " EMAIL_PASS
echo
if [[ -z "$EMAIL_PASS" ]]; then
    echo "Error: Email password cannot be empty."
    exit 1
fi

# Prompt for check interval
read -p "Enter the check interval in minutes (default is 30): " CHECK_INTERVAL
if [[ -z "$CHECK_INTERVAL" ]]; then
    CHECK_INTERVAL=30
fi
CHECK_INTERVAL_MS=$((CHECK_INTERVAL * 60 * 1000))

# Create the .env file
echo "Creating .env file..."

cat <<EOF > .env
REPO=$REPO
ADMIN_EMAIL=$ADMIN_EMAIL
EMAIL_USER=$EMAIL_USER
EMAIL_PASS=$EMAIL_PASS
CHECK_INTERVAL=$CHECK_INTERVAL_MS
EOF

echo ".env file created successfully!"
echo
echo "Contents of .env file:"
cat .env

echo
echo "Setup complete. You can now run RepoMan2."

