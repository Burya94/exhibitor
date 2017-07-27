class exhibitor::install(
  $install_dir = $exhibitor::install_dir,
  $version = $exhibitor::version,
  ) {

  file { $install_dir:
    ensure => directory,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  }

  file { "${install_dir}/pom.xml":
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('exhibitor/pom.xml.erb'),
    notify  => Class['exhibitor::running'],
  }

  exec { 'build-exhibitor':
    command => "/usr/bin/mvn clean package -f ${install_dir}/pom.xml && /bin/cp ${install_dir}/target/exhibitor-${version}.jar ${install_dir}/exhibitor-${version}.jar",
    creates => "${install_dir}/exhibitor-${version}.jar",
    require => File["${install_dir}/pom.xml"],
    unless  => "/usr/bin/test -f ${install_dir}/exhibitor-${version}.jar",
    notify  => Service['exhibitor'],
  }
}
