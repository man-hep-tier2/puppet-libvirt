# == Class: libvirt::manage_domains_config
#
# Installs configuration files for manage-domains script
#
# === Parameters
#
# [*manage_domains_config*]
#   file where the manage_domains configuration is.
#   Defaults to $libvirt::params::manage_domains_config
#   Remark: if you change this, you also have to change in
#   libvirt::domain define
#
class libvirt::manage_domains_config (
  $manage_domains_config = $libvirt::params::manage_domains_config,
) inherits ::libvirt::params {


  concat { $manage_domains_config:
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  concat::fragment { "${manage_domains_config} header":
    target  => $manage_domains_config,
    content => template('libvirt/manage-domains.ini.header.erb'),
    order   => '01',
  }
}
