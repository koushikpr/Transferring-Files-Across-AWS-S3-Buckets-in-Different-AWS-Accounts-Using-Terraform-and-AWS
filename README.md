# Transferring-Files-Across-AWS-S3-Buckets-in-Different-AWS-Accounts-Using-Terraform-and-AWS

Pre-requisities for this project: 
---
1. AWS Account
* Create Two AWS Accounts
* Enable it
---
2. AWS For Windows/Linux/MacOs
* Linux OS
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```
* Windows 
```
msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi
```
* MacOS
```
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
```
---
3. Terraform
* Linux OS
```
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```
* Windows
``` 
[https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_windows_386.zip](url)
```
* MacOS
```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

To Run The Code Between 2 Accounts we are required to run the files for the respective Account Credentials.
--
1. Provide Your AWS Access Key and Secret Key In the Security Credentials Folder of Each Account

2. Once Entered the Credentials, Provide the AWS Account No of the Account2 in the account1/aws_account_1_bucket.tf file along with the File Path.

3. Run the Terraform Script in both the Folders
```
terraform init
terraform plan
terraform apply
```

4. Once Built, Go to Console-> IAM -> Users -> User -> Access-key and download your access key and secret key.

5. Now go to your Terminal and Run
```
aws configure set aws_access_key_id <yourAccessKey>
aws configure set aws_secret_access_key <yourSecretKey>
```

6. Once Completed To finally transfer the files btw these buckets Run
```
aws s3 sync s3://kprbucket1 s3://kprbucket2 --copy-props none
```





