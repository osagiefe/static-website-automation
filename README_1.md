# Static Website Automation

 ## Project Scope
Given a Github repository of a static website, I will be automating the deployment of this website in AWS Cloud. Using Terraform, deploy AWS infrastructure with apache webserver. Finally, deploy website within running apache webserver default webfolder (/var/www/html)

# AWS Architecture Diagram
<img width="967" height="580" alt="Image" src="https://github.com/user-attachments/assets/a6ad0102-29ea-4f9d-9617-e210d6f43268" />

# Tools
  - VS Code
  - Terraform
  - AWS IAM
  - GitHub
  - apache
  - apache.sh and siteinstall.sh shell scripts

# Steps:
  ## Terraform file
  <img width="347" height="660" alt="Image" src="https://github.com/user-attachments/assets/7f672e5c-0477-4204-88d2-d648fda7db29" />

  ## Execute Terraform to build AWS infrastructure
  <img width="1133" height="407" alt="Image" src="https://github.com/user-attachments/assets/505f05bc-460c-4b87-ab63-508b2a39d1d4" />

  ## AWS instance
  <img width="1431" height="812" alt="Image" src="https://github.com/user-attachments/assets/1880313b-2ea5-4432-be00-109e7d4bd322" />

  ## Apache default page
  <img width="801" height="848" alt="Image" src="https://github.com/user-attachments/assets/a9ccc098-b0f7-4d8e-8089-d15bd50835e4" />

  ## Connect to EC2 instance via ssh
  <img width="1432" height="696" alt="Image" src="https://github.com/user-attachments/assets/e189497d-af36-45d7-aca4-8cceb06d07e6" />

  <img width="861" height="547" alt="Image" src="https://github.com/user-attachments/assets/5af34905-9b71-45cb-b4d4-9a387e55512b" />

  ## Create a file for the script
  <img width="505" height="37" alt="Image" src="https://github.com/user-attachments/assets/14709dd6-ed49-473d-a94a-d98d7bf82113" />
  
  ## Create shell script for siteinstall
  #!/bin/bash
set -e

sudo apt update -y
sudo apt install -y apache2 git

sudo systemctl stop apache2

sudo rm -rf /var/www/html/*
rm -rf /tmp/static-website-automation

git clone https://github.com/osagiefe/static-website-automation.git /tmp/static-website-automation

sudo cp -r /tmp/static-website-automation/* /var/www/html/

sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

sudo systemctl enable apache2
sudo systemctl start apache2

echo "Website deployment completed successfully."

  ## Make script executable for everyone
  <img width="543" height="33" alt="Image" src="https://github.com/user-attachments/assets/574c80ca-71ae-4d31-8adf-4f5c1c8c3971" />

  ## Execute siteinstall.sh on apache server
  <img width="1202" height="420" alt="Image" src="https://github.com/user-attachments/assets/40658399-2f75-4633-825e-af4c95e6ee78" />

# Website Deployed
<img width="1883" height="942" alt="Image" src="https://github.com/user-attachments/assets/5b78c5c5-a1ec-4395-b6d0-c117e605c458" />

# Project Challenge(s)
I was trying to repopurse the script I used previously for downloading a ziped archieved file. It failed because:
- The GitHub is download is a URL while my previous code was downloading a zip archive file
- I had a mismatch folder name after extraction "/tmp/jupiter-main"
- Deleting /var/www.html entire would work, but not safer to only delete the contents.

# Solution
- I change my code to use "git clone https://github.com/osagiefe/static-website-automation.git /tmp/jupiter-main "
- Changed extraction file to " /tmp/static-website-automation-main"
- I simply delete the contents with 
sudo rm -rf /var/www/html/* which avoids accidentally breaking Apache configurations that may reference the directory.
