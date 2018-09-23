# Test the template

## Run
    terraform init
    terraform apply

## Connect to the vm through the load balancer

Go to your azure portal and get the vm public ip

Then
    ssh testadmin@VM_PUBLIC_IP 
    (pwd : admin!1234)
