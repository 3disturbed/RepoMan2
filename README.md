![image](https://github.com/user-attachments/assets/47e768e6-8a2d-464f-8684-f7de0b357bb5)

## Table of Contents

1. [Introduction](#introduction)
2. [Key Features](#key-features)
3. [How RepoMan2 Can Help Developers and Teams](#how-repoman2-can-help-developers-and-teams)
4. [Linux Setup Guide](#linux-setup-guide)
   - [Prerequisites](#prerequisites)
   - [Cloning the RepoMan2 Repository](#cloning-the-repoman2-repository)
   - [Installing Dependencies](#installing-dependencies)
   - [Creating the Environment File](#creating-the-environment-file)
   - [Starting RepoMan2](#starting-repoman2)
   - [Logs and Monitoring](#logs-and-monitoring)
   - [Troubleshooting](#troubleshooting)
   - [Additional Setup](#additional-setup)
5. [Windows Setup Guide](#windows-setup-guide)
   - [Prerequisites](#windows-prerequisites)
   - [Cloning the RepoMan2 Repository](#windows-cloning-the-repoman2-repository)
   - [Installing Dependencies](#windows-installing-dependencies)
   - [Creating the Environment File](#windows-creating-the-environment-file)
   - [Starting RepoMan2](#windows-starting-repoman2)
6. [Getting in Touch](#getting-in-touch)
7. [License](#license)

## Introduction

RepoMan2 is a Node.js-based service designed to help developers and teams maintain their applications seamlessly. It monitors a specified GitHub repository for changes and automatically updates the local version of the application when changes are detected. RepoMan2 takes care of creating backups of existing files, updating the service, and ensuring stability by monitoring for errors and crashes.

[Back to Table of Contents](#table-of-contents)

## Key Features

- **Automatic Updates**: RepoMan2 monitors your GitHub repository for updates. Whenever new changes are pushed to the repository, RepoMan2 pulls the latest changes and updates your local instance.
- **Backup Management**: Before applying updates, RepoMan2 creates a backup of the current application files, ensuring you can always revert to a working version if something goes wrong.
- **Error Handling and Notification**: If an update causes the service to fail, RepoMan2 automatically restores the previous backup and sends a notification to the admin email using nodemailer, providing details about the failure.
- **Stability Checks**: RepoMan2 ensures the application runs without issues for a defined period before clearing backups, adding an extra layer of stability assurance.

[Back to Table of Contents](#table-of-contents)

## How RepoMan2 Can Help Developers and Teams

RepoMan2 is a valuable tool for developers and teams looking to streamline their deployment and update process. Here are some of the ways it can help:

- **Reduced Downtime**: By automatically applying updates and rolling back changes if something goes wrong, RepoMan2 minimizes downtime, ensuring your application is always available.
- **Hands-Off Deployment**: Developers can focus on building features rather than manually deploying updates. RepoMan2 takes care of pulling updates and restarting the service, making the deployment process seamless.
- **Error Notifications**: With built-in notification support, RepoMan2 keeps the admin informed of any issues, allowing teams to respond quickly to unexpected problems.
- **Version Control Integration**: RepoMan2 integrates directly with GitHub, making it easy to manage application versions and updates. Teams can push changes to the repository and trust that RepoMan2 will handle the deployment safely.
- **Backup and Recovery**: The built-in backup system ensures that updates are never risky. If an update causes problems, RepoMan2 will restore the previous working version automatically, providing peace of mind for the development team.

RepoMan2 is particularly useful for small to medium-sized teams that want to automate their update process without setting up a full continuous integration/continuous deployment (CI/CD) pipeline. It offers an easy-to-use, reliable solution to keep applications updated and running smoothly.

[Back to Table of Contents](#table-of-contents)

## Linux Setup Guide

Follow these steps to set up RepoMan2 on a Linux machine. This guide will walk you through the necessary preparations and configuration for running RepoMan2.

### Prerequisites

- **Node.js**: Ensure Node.js (version 14 or higher) is installed. You can check your current version by running:
  ```sh
  node -v
  ```
  If Node.js is not installed, you can install it using:
  ```sh
  sudo apt update
  sudo apt install nodejs npm
  ```

- **Git**: Ensure Git is installed to enable repository management.
  ```sh
  sudo apt install git
  ```

- **Nodemailer Requirements**: Make sure that you have an email address and credentials ready to configure nodemailer for notification purposes.

[Back to Table of Contents](#table-of-contents)

### Cloning the RepoMan2 Repository

Clone the repository to your local machine using the following command:
```sh
 git clone https://github.com/3disturbed/RepoMan2.git
```

Navigate to the project directory:
```sh
cd RepoMan2
```

[Back to Table of Contents](#table-of-contents)

### Installing Dependencies

Install all required dependencies:
```sh
npm install
```

[Back to Table of Contents](#table-of-contents)

### Creating the Environment File

To set up the `.env` configuration file, you can use the Linux wizard script provided in the repository. This script will guide you through entering the required details to create a complete `.env` file.

1. Make the setup script executable:
   ```sh
   chmod +x create_env.sh
   ```

2. Run the script:
   ```sh
   ./create_env.sh
   ```

3. Follow the on-screen prompts to provide:
   - GitHub repository URL
   - Admin email for notifications
   - Sender email for notifications
   - Email password (for sending notifications)
   - Check interval (default is 30 minutes)

[Back to Table of Contents](#table-of-contents)

### Starting RepoMan2

After setting up the `.env` file, you can start RepoMan2 using the following command:
```sh
npm run start
```

[Back to Table of Contents](#table-of-contents)

### Logs and Monitoring

To ensure everything is running smoothly, consider using `pm2` to run the service. PM2 is a process manager for Node.js applications, which allows you to keep your application running even after system reboots.

Install PM2:
```sh
sudo npm install -g pm2
```

Start RepoMan2 with PM2:
```sh
pm2 start npm --name "RepoMan2" -- run start
```

To save the PM2 process list and resurrect it on reboot:
```sh
pm2 save
pm2 startup
```

[Back to Table of Contents](#table-of-contents)

### Troubleshooting

- **Permission Issues**: If you encounter permission issues, consider using `sudo` or ensuring that your user has sufficient privileges.
- **Environment Variables Not Loading**: Make sure your `.env` file is correctly formatted and contains all necessary values.

[Back to Table of Contents](#table-of-contents)

### Additional Setup

If you want RepoMan2 to automatically start on system boot, you can add a cron job that triggers PM2's resurrect command:
```sh
@reboot pm2 resurrect
```

[Back to Table of Contents](#table-of-contents)

## Windows Setup Guide

Follow these steps to set up RepoMan2 on a Windows machine. This guide will walk you through the necessary preparations and configuration for running RepoMan2.

### Prerequisites

- **Node.js**: Ensure Node.js (version 14 or higher) is installed. You can check your current version by running:
  ```cmd
  node -v
  ```
  If Node.js is not installed, you can download and install it from [Node.js Official Website](https://nodejs.org/).

- **Git**: Ensure Git is installed to enable repository management. You can download Git from [Git for Windows](https://git-scm.com/download/win).

- **Nodemailer Requirements**: Make sure that you have an email address and credentials ready to configure nodemailer for notification purposes.

[Back to Table of Contents](#table-of-contents)

### Cloning the RepoMan2 Repository

Clone the repository to your local machine using the following command in Command Prompt:
```cmd
 git clone https://github.com/3disturbed/RepoMan2.git
```

Navigate to the project directory:
```cmd
cd RepoMan2
```

[Back to Table of Contents](#table-of-contents)

### Installing Dependencies

Install all required dependencies:
```cmd
npm install
```

[Back to Table of Contents](#table-of-contents)

### Creating the Environment File

To set up the `.env` configuration file, you can use the Windows wizard batch script provided in the repository. This script will guide you through entering the required details to create a complete `.env` file.

1. Run the setup script by double-clicking `create_env.bat` or executing the following command in Command Prompt:
   ```cmd
   create_env.bat
   ```

2. Follow the on-screen prompts to provide:
   - GitHub repository URL
   - Admin email for notifications
   - Sender email for notifications
   - Email password (for sending notifications)
   - Check interval (default is 30 minutes)

[Back to Table of Contents](#table-of-contents)

### Starting RepoMan2

After setting up the `.env` file, you can start RepoMan2 using the following command:
```cmd
npm run start
```

[Back to Table of Contents](#table-of-contents)

## Getting in Touch

If you have any questions, issues, or suggestions for RepoMan2, feel free to get in touch:

- **Email**: [support@example.com](mailto:support@example.com)
- **GitHub Issues**: [Open an issue on GitHub](<REPO_ISSUES_URL>)

We welcome contributions and feedback from the community!

[Back to Table of Contents](#table-of-contents)

## License

RepoMan2 is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

[Back to Table of Contents](#table-of-contents)

