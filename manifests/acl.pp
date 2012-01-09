define bind::acl (
	$nodes = ''
) {
	include bind

    concat::fragment { "acl_${name}" :
		target		=> $bind::local_conf,
		content		=> template('bind/acl.erb'),
		order		=> 10,
    }
}