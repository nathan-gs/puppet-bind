define bind::zone (
	$is_slave	= true,
	$slave_acl_name	= 'slaves'
) {
	
	include bind

    concat::fragment { "zone_${name}" :
		target		=> $bind::local_conf,
		content		=> template('bind/zone.erb'),
		order		=> 20,
    }
}