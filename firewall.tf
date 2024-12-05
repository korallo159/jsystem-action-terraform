

resource "digitalocean_firewall" "main" {
  name = "firewall ko"
  droplet_ids = concat(digitalocean_droplet.n_instance.*.id)

  inbound_rule {
    protocol = "tcp"
    port_range = "22"
    source_addresses = ["0.0.0.0/0"]
  }

    inbound_rule {
    protocol = "tcp"
    port_range = "80"
    source_addresses = ["0.0.0.0/0"]
  }

    inbound_rule {
    protocol = "tcp"
    port_range = "443"
    source_addresses = ["0.0.0.0/0"]
  }

  outbound_rule {
    protocol = "tcp"
    port_range = "1-65535"
    destination_addresses = ["0.0.0.0/0"]
  }

  outbound_rule {
    protocol = "udp"
    port_range = "1-65535"
    destination_addresses = ["0.0.0.0/0"]
  }

    outbound_rule {
    protocol = "icmp"
    port_range = "1-65535"
    destination_addresses = ["0.0.0.0/0"]
  }
}