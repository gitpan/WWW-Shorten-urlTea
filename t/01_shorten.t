#!/usr/bin/perl

use Test::More tests => 1;
use WWW::Shorten::urlTea;
use WWW::Shorten 'urlTea';

my $short = makeashorterlink(
 'http://search.cpan.org/~bgilmore/'
);

is($short, 'http://urltea.com/2uj8');
