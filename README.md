# Kubernets

Use terraform
-------------------
Use terraform to build the two nodes ( Master and Worker ) for the Kubernets Cluster.
 Need to create credentials.json in gcp cloud and also have the id_rsa.pub which we have to use in ssh-key in instance.tf 
 instance.tf will create two instances and download the kubernets cluster-setup files.

Command: terraform.exe apply --auto-approve

Once the instance up use Ansibel playbooks 
--------------------------------------------
gcp.yaml will call the inventory/service-account.json (same credentails.json) and polpulate the dynamic inventory of GCP Cloud infrastructure.

1. Install google-auth module using pip. I am using pip3.
   sudo pip3 install requests google-auth
2. Create an inventory directory. 
   sudo mkdir -p /opt/ansible/inventory

3. Create the YAML inventory file (gcp.yaml) and copy the below contents and please change the file according to your project and service account: 

---
plugin: gcp_compute
projects:
          - [your_gcp_project_id]
auth_kind: serviceaccount
service_account_file: /opt/ansible/inventory/service-account.json
groups:
          worker: "'worker' in name"
          master: "'server' in name"

4. Change directory permission
   sudo chmod -R 755 /opt/ansible


Playbooks
----------

cd /opt/ansible/
 - ansible-playbook master-kubernet.yaml
 - ansible-playbook worker-kubernet.yaml
 - ansible-playbook deployment.yaml # this will deploy the Oracle 12c database

