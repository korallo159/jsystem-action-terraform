# Terraform with Github Actions

This repository contains a simple example of how to use Github Actions to run Terraform commands.

## Your task

1. Fork this repository
2. Create a VPC on digitalocean in region fra1 (digitalocean_vpc resource)
3. Create code with Terraform that creates:
    - a Project in Digital Ocean (digitalocean_project resource)
    - a SSH key with tls_private_key (tls_private_key resource)
    - add this key to digitalocean (digitalocean_ssh_key resource)
    - a Droplet one with ubuntu 22.04 one with 20.04 (digitalocean_droplet resource)
    - add this droplet to the project
    - add this droplet to created VPC
4. Create firewall with rules: (use dynamic blocks) (digitalocean_firewall resource)
    - allow incoming traffic on port 22 from your IP
    - allow incoming traffic on port 80
    - allow incoming traffic on port 443
5. Create firewall with rules: (use dynamic blocks) (digitalocean_firewall resource)
    - allow outgoing traffic on all ports (tcp, udp, icmp)
6. Add droplet to the firewall
7. Create a Github Actions workflow that will run Terraform commands
    - terraform init
    - terraform validate and fmt
    - terraform plan
    - terraform apply
