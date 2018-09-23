# Test the template

You will deploy the following architecture

---
![graph](graph.svg)

---
## Run
    terraform init
    terraform apply

## Connect to the vm through the load balancer

Go to your azure portal and get the vm public ip

Then
    ssh testadmin@VM_PUBLIC_IP 
    (pwd : admin!1234)
