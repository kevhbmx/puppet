class ess::etchosts (
$etchosts_add = hiera_array('etchosts_add', ''),
$etchosts_alias = hiera('etchosts_alias', '')
)
{
  file { 'Hosts File':
  ensure  => file,
  path    => '/etc/hosts',
  mode    => '0444',
  content => template('ess/etchosts.erb'),
}
}
