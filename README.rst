Puppet module to manage BIND
############################

Copy the module to your modules dir. Add a site-bind module. Add the bind dns zone files to the site-bind files directory.

Add to your node definition::

    include bind

Define some ACL::

	bind::acl { "slaves" : 
		nodes => [
			'10.0.0.1',
			'192.168.1.1/24'
		]
	}

Define your zones.::

	bind::zone { "example.org" : }
	bind::zone { "example.com" : }


Requirements
************

- concat puppet module [#]_

.. [#] https://github.com/example42/puppet-modules