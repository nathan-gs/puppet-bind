class bind {
		

	package {"bind9":
		ensure => present,
	}

	service {"bind9":
		ensure  => running,
		enable  => true,
		require => Package["bind9"],
	}

	file {["/etc/bind/zones"]:
		ensure => directory,
		owner  => root,
		group  => root,
		mode   => 0755,
		require => Package["bind9"],
		source => [
			"puppet:///modules/site-bind/zones",
			"puppet:///modules/bind/zones"
			],
		recurse => true,
		notify	=> Service['bind9']
	}

	include concat::setup
	
	$local_conf = '/etc/bind/named.conf.local'

	concat { $local_conf :
		owner => root,
		group => root,
		mode => 644,
		notify => Service['bind9']
	}

	concat::fragment { "header" :
		target => $local_conf,
		content => "// Puppet managed zone config file.\n\n",
		order => 01
	}
}