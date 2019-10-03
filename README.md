# Create 5 node F5 DNS/GTM cluster using Ansible and Terraform

## Usage
 - To create the cluster
   - /ansible/ansible-playbook create_playbook.yml
 - To destroy the cluster
   - /ansible/ansible-playbook destroy_playbook.yml

## Ansible
 - Playbook:
   - Creates 'admin' password for BIG-IPs
   - Performs a Terraform apply to create AWS elements
   - Waits for port 8443 to be available on BIG-IPs
   - Updates password for 'admin' and sets shell to bash
   - Waits until iControl REST is available on BIG-IPs
   - Performs a save on BIG-IP
   - Uploads F5's Device Onboarding(DO) and AS3 rpms
   - Deploy's DO to configure to provision GTM and set NTP servers
   - Updates GSLB settings
      - Creates DataCenters
      - Add's servers
   - Performs a bigip_add
   - Performs a gtm_add


## Terraform
 - Create the below in 5 regions: us-east-1, us-east-2, us-west-2,eu-west-2, ap-southeast-1
   - VPC
   - Subnet
   - Internet Gateway
   - Routing
   - Security Groups for: 
   - BIG-IP PAYG Better 1Gbps with version 14.1.2

## What you may need to update for your environment
  - Ansible, update Declarative Onboarding declaration
    - /ansible/files/deviceOnboarding.json
    - NTP, DNS, Auth, SNMP, etc., as needed
    - Documentation:
      - https://clouddocs.f5.com/products/extensions/f5-declarative-onboarding/latest/
  - Ansible, update create_playbook.yml
    - /ansible/create_playbook.yml
    - update the aws variable with appropriate regions & keys
      - note the first region name has underscores in the name, this is due to an Ansible restriction.  The region key has the correct value with dashes.

  - Terraform, update main.tf to match your needs
    - /terraform/modules/main.tf
      - Security Group settings - allow the traffic necessary for communication. SSH, Mgmt, iQuery, etc
      - AWS_Instance - F5 BIG-IP
        - instance type
  - Terraform, update vars.tf to match your needs
    - /terraform/modules/vars.tf
      - update the variable section "aws_region" to the regions you're targeting
      - update the variable section "ami" to the AMI's for the regions you're targeting 
      - update the variable section "key_pair" to match your key's for each region

## Versions
  - Ansible: 2.8.5
  - Terraform: 0.12.1
  - F5 Declarative Onboarding: 1.7
  - F5 Application Services 3: 3.14
  - AWS cli: aws-cli/1.16.170 Python/3.7.3 Darwin/18.7.0 botocore/1.12.160