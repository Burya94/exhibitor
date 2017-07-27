# Class: exhibitor
# ===========================
class exhibitor(
    $version = '1.5.6',
    $install_dir = '/opt/exhibitor',
    $defaultfile_opts = {
      'port'        => '8080',
      'configtype'  => 's3',
      's3region'    => 'us-east-1',
      's3config'    => 'puppet_bucket_test:exhibitor',
      's3credentials'=> '${install_dir}/ex.cred',
      'hostname'    =>  $fqdn,
      },
    $zk_data_dir = '/var/lib/zookeeper/',
    $zk_log_dir = '/var/log/zookeeper/',
    $zk_install_dir = '/opt/zookeeper',
    #exhibitor.properties options
    $auto_manage_instances='1'
  ) {
    require 'maven'
    contain exhibitor::install
    contain exhibitor::config
    contain exhibitor::running
}
