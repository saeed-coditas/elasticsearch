# Elasticsearch Assignment

Q.1 What did you choose to automate the provisioning and bootstrapping of the instance? Why?

    Solution 1:
    Automation: Used Terraform for provisioning the AWS resources.
    BootStraping: Used a Shell Scripting for installing & configuring the elasticsearch.
    
    Solution 2:
    Automation: Used Terraform for provisioning the AWS resources.
    BootStraping: Used an Ansible for installing & configuring the elasticsearch.

Q.2 How did you choose to secure ElasticSearch? Why?

    We can secure elasticseach using SSL Certificate/TLS  Connections and also we can configured using User/Roles.

Q.3 How would you monitor this instance? What metrics would you monitor?

    We can Monitor the Instances using AWS Cloudwatch Service. Also we can configure Prometheus, Grafana for visualization. We can monitor metrics like CPU Utilization, Memory Utilization and Disk Utilization of the instance.

Q.4 Could you extend your solution to launch a secure cluster of ElasticSearch nodes? What would need to change to support this use case?

    We can secure our ElasticSearch nodes Using SSL/TLS Communication. We can create cluster in private subnet and use VPN to access elasticsearch cluster. Also we can configure Basic Authentication.

Q.5 Could you extend your solution to replace a running ElasticSearch instance with little or no downtime? How?

    We can Use AWS ElasticSearch Manage Service, also we can use scaling.

Q.6 Was it a priority to make your code well structured, extensible, and reusable?

    It is priority to make our code well structured. So later we can modify our code easily with very less efforts.

Q.7 What sacrifices did you make due to time?

    SSL Automation connection is pending for DNS. But it's working with default SSL with IP.


## Prerequisites

[AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) - (Install AWS CLI & Configure aws profile)

    aws configure --profile <profile-name>
    
[Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli#install-terraform) - (Install Terraform)

[Ansible](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html) - (Install Ansible)

## Folder Structure

##### I have solved assignment using two ways both are in separate folders
##### There are two folders solution1 & solution2

#### Solution1:

solution1 folder content   | ec2 module folder content |  vpc module folder content       
:-------------------------:|:-------------------------:|:-------------------------:
![image](https://user-images.githubusercontent.com/76781622/199658053-88a62e18-2f9a-47ea-a15d-a336b9fc7a44.png) | ![image](https://user-images.githubusercontent.com/76781622/199658110-dce24e38-235b-4ed3-9c84-f96d3516a1e2.png) | ![image](https://user-images.githubusercontent.com/76781622/199658154-1a9b83ac-1194-49f9-971c-680bd7043801.png)

##### Steps to deploy elasticsearch

Make proper changes to variables.tf files inside module/ec2 & module/vpc according to your requirement
userdata.sh file is there in solution1 folder for installation & configuration elasticsearch
#change bucket name in last line which saves elasticsearch password to S3

    cd elasticsearch/solution1
    terraform init
    terraform plan
    terraform apply


#### Solution2:

solution2 folder content   | ec2 folder content |  vpc module folder content       
:-------------------------:|:-------------------------:|:-------------------------:
![image](https://user-images.githubusercontent.com/76781622/199659896-757d8c9f-a5bd-4803-8112-359891d79589.png) | ![image](https://user-images.githubusercontent.com/76781622/199659944-92d031cc-3f7e-42d1-8181-07d05d3b6920.png) | ![image](https://user-images.githubusercontent.com/76781622/199659980-5fc68326-f76d-4d5c-9a57-820a1fb184a8.png)

##### Steps to deploy elasticsearch

Make proper changes to terraform.tfvars & locals.tf files inside ec2 & vpc according to your requirement
playbook.yml is there in ec2 folder for installation & configuration elasticsearch
#change bucket name in last line which saves elasticsearch password to S3

    cd elasticsearch/solution2/vpc
    terraform init
    terraform plan
    terraform apply
    
    cd elasticsearch/solution2/ec2
    terraform init
    terraform plan
    terraform apply


## Screenshots

##### Login with Basic Auth UserName & Password:

![image](https://user-images.githubusercontent.com/76781622/199305183-e7722dcb-2b5e-4a39-a808-aee2eb02d310.png)

##### Screen after login:

![image](https://user-images.githubusercontent.com/76781622/199305779-cf1fd728-452b-4096-ab96-5e50ebbcd0b1.png)

##### Created an Elasticsearch Index Using cURL & View:

![image](https://user-images.githubusercontent.com/76781622/199325111-28908468-1437-4443-9cea-dbdd11dd319f.png)

##### 
