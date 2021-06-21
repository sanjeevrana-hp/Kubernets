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

Playbooks
----------

cd /opt/ansible/
 - ansible-playbook master-Kubernet.yaml
 - ansible-playbook worker-Kubernet.yaml
 - ansible-playbook deployment.yaml # this will deploy the Oracle 12c database

