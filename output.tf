output "entrance_zagovorov_ru_ip_addr_external" {
  value = yandex_compute_instance.entrance_instance.network_interface.0.nat_ip_address
}

output "db01_zagovorov_ru_ip_addr_internal" {
  value = yandex_compute_instance.db01_instance.network_interface.0.ip_address
}

output "db02_zagovorov_ru_ip_addr_internal" {
  value = yandex_compute_instance.db02_instance.network_interface.0.ip_address
}

output "app_zagovorov_ru_ip_addr_internal" {
  value = yandex_compute_instance.app_instance.network_interface.0.ip_address
}

output "monitoring_zagovorov_ru_ip_addr_internal" {
  value = yandex_compute_instance.monitoring_instance.network_interface.0.ip_address
}

output "gitlab_zagovorov_ru_ip_addr_internal" {
  value = yandex_compute_instance.gitlab_instance.network_interface.0.ip_address
}

output "runner_zagovorov_ru_ip_addr_internal" {
  value = yandex_compute_instance.runner_instance.network_interface.0.ip_address
}

output "ssh_config" {
  value = <<-EOT
  Host zagovoroff.ru
    HostName ${yandex_compute_instance.entrance_instance.network_interface.0.nat_ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa

  Host db01.zagovoroff.ru
    HostName ${yandex_compute_instance.db01_instance.network_interface.0.ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
      ProxyJump ubuntu@${yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address}
      ProxyCommand ssh -W %h:%p -i .ssh/id_rsa

  Host db02.zagovoroff.ru
    HostName ${yandex_compute_instance.db02_instance.network_interface.0.ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
      ProxyJump ubuntu@${yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address}
      ProxyCommand ssh -W %h:%p -i .ssh/id_rsa

  Host app.zagovoroff.ru
    HostName ${yandex_compute_instance.app_instance.network_interface.0.ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
      ProxyJump ubuntu@${yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address}
      ProxyCommand ssh -W %h:%p -i .ssh/id_rsa

  Host monitoring.zagovoroff.ru
    HostName ${yandex_compute_instance.monitoring_instance.network_interface.0.ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
      ProxyJump ubuntu@${yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address}
      ProxyCommand ssh -W %h:%p -i .ssh/id_rsa

  Host gitlab.zagovoroff.ru
    HostName ${yandex_compute_instance.gitlab_instance.network_interface.0.ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
      ProxyJump ubuntu@${yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address}
      ProxyCommand ssh -W %h:%p -i .ssh/id_rsa

  Host runner.zagovoroff.ru
    HostName ${yandex_compute_instance.runner_instance.network_interface.0.ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
      ProxyJump ubuntu@${yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address}
      ProxyCommand ssh -W %h:%p -i .ssh/id_rsa

  EOT
}
