terraform {
    required_providers {
      libvirt = {
        source = "dmacvicar/libvirt"
      }
    }
}

provider "libvirt" {
    uri = "qemu:///system"
}

resource "libvirt_domain" "test-domain" {
    name = "test-domain"
    description = "test vm terraform"
    vcpu = 2
    memory = 1024
    running = false

    disk {
        volume_id = libvirt_volume.iso.id
    }
}

resource "libvirt_volume" "iso" {
    name = "test-iso"
    source = "/home/patrick/test/terraform/debian.qcow2"
}