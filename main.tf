resource "digitalocean_project" "main" {
  name = "main-ko"
  description = "Main project for ko"
  purpose = "test"
  environment = "development"
  resources = [ for vm in digitalocean_droplet.n_instance : vm.urn ]
}

resource "digitalocean_vpc" "siec" {
  name     = "ko-tf"
  region   = "fra1"
  ip_range = "10.0.0.0/16"
}

resource "tls_private_key" "private_key" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

resource "digitalocean_ssh_key" "main" {
  name       = "keyko"
  public_key = tls_private_key.private_key.public_key_openssh
}


resource "digitalocean_droplet" "n_instance" {
  count = 2
  name = "vm-${count.index+1}"
  image = count.index == 0 ? "ubuntu-20-04-x64" : "ubuntu-22-04-x64"
  region = "fra1"
  size = "s-1vcpu-1gb"
  vpc_uuid = digitalocean_vpc.siec.id
  ssh_keys = [ digitalocean_ssh_key.main.id ]
}

