class exhibitor::running(){

  file { '/etc/systemd/system/exhibitor.service':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('exhibitor/exhibitor.service.erb'),
    require => Exec['build-exhibitor'],
  }

  service { 'exhibitor':
    ensure  => 'running',
    require => File['/etc/systemd/system/exhibitor.service']
  }
}
