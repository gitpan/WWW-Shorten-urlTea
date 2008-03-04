package WWW::Shorten::urlTea;

=head1 NAME

WWW::Shorten::urlTea - Perl interface to urltea.com

=head1 SYNOPSIS

  use WWW::Shorten::urlTea;
  use WWW::Shorten 'urlTea';

  $short_url = makeashorterlink($long_url);

  $long_url  = makealongerlink($short_url);

=head1 DESCRIPTION

A Perl interface to the web site urltea.com. urlTea maintains a
database of long URLs, each of which has a unique identifier.

=cut

use strict;
use warnings;
use Carp;

use base qw/WWW::Shorten::generic Exporter/;

our @EXPORT  = qw/makeashorterlink makealongerlink/;
our $VERSION = '0.01';

=head1 Functions

=head2 makeashorterlink

The function C<makeashorterlink> will call the urlTea web site passing
it your long URL and returning the shortened version.

Returns C<undef> on failure.

=cut

sub makeashorterlink ($)
{
    my $url = shift or croak 'No URL passed to makeashorterlink';
    my $ua  = __PACKAGE__->ua();

    my $res = $ua->get("http://urltea.com/api/text/?url=$url");
    return undef unless $res->is_success;

    if ($res->content =~ m|^(http://urltea.com/\w+)$|) {
	    return $1;
    } else {
        return undef;
    }
}

=head2 makealongerlink

The function C<makealongerlink> takes a full urlTea URL and returns the
corresponding long URL.

Returns C<undef> on failure.

=cut

sub makealongerlink ($)
{
    my $url = shift or croak 'No URL passed to makealongerlink';
    my $ua  = __PACKAGE__->ua();
    
    # really, I should leave this logic to the user
    return undef unless ($url =~ m!^http://urltea\.com/\w+$!i);

    my $res = $ua->head($url);
    return undef unless $res->is_redirect;

    return $res->header('Location');
}

1;

__END__

=head2 EXPORT

makeashorterlink, makealongerlink

=head1 SUPPORT, LICENCE, THANKS and SUCH

See the main L<WWW::Shorten> docs.

=head1 AUTHOR

Brandon Gilmore <brandon@mg2.org>

=head1 SEE ALSO

L<WWW::Shorten>, L<http://urltea.com/>

=cut
