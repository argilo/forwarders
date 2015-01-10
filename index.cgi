#!/usr/bin/perl
# index.cgi
# Show a list of domains with forwarders.

require './forwarders-lib.pl';

&ui_print_header(undef, 'Retposxtaj Plusendiloj', '');

@domains = &list_domains();
print "<p>Elektu domajnon:</p>\n";
print "<ul>\n";
for ($i = 0; $i < @domains; $i++) {
	print '<li><a href="list_aliases.cgi?domain=' . $i . '">' . $domains[$i] . "</a></li>\n";
}
print "</ul>\n";

&ui_print_footer();
