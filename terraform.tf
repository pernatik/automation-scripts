terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  cloud_id  = "b1g3jddf4nv5e9okle7p"
  folder_id = "b1g10hb6v5a9qe3ut7na"
  zone      = "ru-central1-a"
} 

resource "yandex_compute_instance" "andrey-kovalev-18-12-terraform" {
    name = "chapter5-lesson2-std-011-065"

    resources {
        cores  = 2
        memory = 2
    }

    boot_disk {
        initialize_params {
            image_id = "fd80qm01ah03dkqb14lc"
        }
    }

    network_interface {
        subnet_id = "e9bd4vf8tm60md55lp0k"
        nat       = false
    }

    metadata = {
        ssh-keys = "ubuntu:${file("/home/user-backup/.ssh/id_rsa.pub")}"
    }
} 