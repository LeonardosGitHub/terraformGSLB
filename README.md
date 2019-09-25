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

