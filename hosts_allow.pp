class ess::hosts_allow (
$hosts_allow = hiera_array('hosts_allow', '' )
)

{
  file { '/etc/hosts.allow':
  ensure  => file,
  mode    => '0444',
  content => template('ess/hosts_allow.erb')
  }

  file { '/etc/hosts.deny' :
  owner  => 'root',
  group  => 'root',
  mode   => '0444',
  source => 'puppet:///modules/ess/hosts.deny',
  }
}
