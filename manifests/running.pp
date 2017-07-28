class exhibitor::running(
    $defaultfile_opts = $exhibitor::defaultfile_opts
    ){

  file { '/etc/systemd/system/exhibitor.service':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('exhibitor/exhibitor.service.erb'),
    require => Exec['build-exhibitor'],
  }

  file { '/opt/exhibitor/exhibitor.sh':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    content => template('exhibitor/exhibitor.sh.erb'),
    require => File['/etc/systemd/system/exhibitor.service']

  }

  service { 'exhibitor':
    ensure  => 'running',
    require => File['/etc/systemd/system/exhibitor.service']
  }
}
