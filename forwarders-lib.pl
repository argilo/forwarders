# forwarders-lib.pl
# Common functions used for the Exim email forwarder module

do '../web-lib.pl';
do '../ui-lib.pl';
&init_config();

# list_domains()
# Returns a sorted array of domains with email forwarders
sub list_domains
{
	$virtual_dir = '/etc/exim4/virtual';
	opendir(DIR, $virtual_dir);
	@domains = grep { -f "$virtual_dir/$_" } readdir(DIR);
	push(@domains, &get_main_domain());
	closedir(DIR);
	return sort @domains;
}

# get_main_domain()
# Returns the main mail domain from /etc/mailname
sub get_main_domain
{
	open(FPTR, '/etc/mailname');
	$main_domain = <FPTR>;
	chop($main_domain);
	close(FPTR);
	return $main_domain;
}
