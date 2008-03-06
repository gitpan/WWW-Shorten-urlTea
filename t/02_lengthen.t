#!/usr/bin/perl

use Test::More tests => 1;
use WWW::Shorten::urlTea;
use WWW::Shorten 'urlTea';

my $long = makealongerlink(
 'http://urltea.com/2uj8'
);

is($long, 'http://search.cpan.org/~bgilmore/');
