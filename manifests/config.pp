class exhibitor::config(
  $defaultfile_opts = $exhibitor::defaultfile_opts,
  $install_dir = $exhibitor::install_dir,
  $zk_data_dir = $exhibitor::zk_data_dir,
  $zk_log_dir = $exhibitor::zk_log_dir,

  $auto_manage_instances = $exhibitor::auto_manage_instances,
  ){
  require exhibitor::install

  file { '/etc/default/exhibitor':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('exhibitor/exhibitor_options.erb')
  }
  file { "${install_dir}/exhibitor.properties":
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('exhibitor/exhibitor.properties.erb'),
    notify  => Class['exhibitor::service'],
}
}