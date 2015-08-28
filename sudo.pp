class ess::sudo (
$sudoers = hiera('sudoers','')
) {
package { ['sudo']:
    ensure => installed,
}

file { '/etc/sudoers':
  ensure  => file,
  mode    => '0400',
  content => template('ess/sudoers.erb')
  }

file { '/etc/pam.d/sudo':
  ensure  => 'file',
  path    => '/etc/pam.d/sudo',
  source  => 'puppet:///modules/ess/sudo',
  }
}
