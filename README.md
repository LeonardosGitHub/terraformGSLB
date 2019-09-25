# Create 5 node F5 DNS/GTM cluster using Ansible and Terraform



## Ansible
 - Provisions 
   - creates 'admin' password for BIG-IPs
   - Performs a Terraform apply to create AWS elements
   - waits for port 8443 to be available on BIG-IPs
   - updates password for 'admin' and sets shell to bash
   - waits until iControl REST is available on BIG-IPs
   - performs a save on BIG-IP
   - uploads F5's Device Onboarding(DO) and AS3 rpms
   - deploy's DO to configure to provision GTM and set NTP servers
   - updates GSLB settings
      - Creates DataCenters
      - Add's servers
   - performs a bigip_add
   - performs a gtm_add


## Terraform
 - Create's 
   - VPC
   - Subnet
   - Internet Gateway
   - Routing
   - Security Groups for: 
   - BIG-IP PAYG Better 1Gbps, 14.1.2

