package WebService::Forrst;

use warnings;
use strict;

use LWP::UserAgent;
use JSON;
use URI;

my $default_host = 'http://api.forrst.com';

=head1 NAME

WebService::Forrst - Wrapper for the forrst.com API

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

This module interacts with the Forrst API.

    use WebService::Forrst;
    
    my $forrst = WebService::Forrst->new;
    my $user_detals = $forrst->user_info(  username => 'Squeeks' );
    my $user_posts  = $forrst->user_posts( username => 'Squeeks' );

=head1 ACHTUNG! RHYBUDD! ATTENTION!

This API is very young, very new and B<very> incomplete. Things will change and move around. Please check the documentation and changelog before upgrading.

=head1 METHODS

=head2 new

Creates a new L<WebService::Forrst> object.

=cut

sub new
{
	my $class = shift;

	my $self = {
		ua  => LWP::UserAgent->new,
		uri => URI->new($default_host),
	};
	
	return bless $self;
}

=head2 user_info( user => $user, id => $user_id)

Request all the information about a user. You can either supply a name, or user ID but do not use both in the same call.

Will return a hashref containing all data on success, or a L<HTTP::Response> object for debugging on fail.

=cut

sub user_info
{
	my($self, %user) = @_;

	my $address = $self->{uri}->clone;
	$address->path('/api/v1/users/info');
	$address->query_form(%user);

	return $self->_request($address->as_string);	
}


=head2 user_posts( username => $user, since => $last_post)

Request posts by a specific user. Username is mandatory, and "since" will supply posts with ID numbers lower than

Will return a hashref containing all data on success, or a L<HTTP::Response> object for debugging on fail.

=cut

sub user_posts
{
	my($self, %user) = @_;

	my $address = $self->{uri}->clone;
	$address->path('/api/v1/users/posts');
	$address->query_form(%user);
	return $self->_request($address->as_string);
}

# _request()
# Central handling of all the requests. Return a hashref on success, HTTP::Response on fail.
sub _request
{
	my($self, $url) = @_;

        my $req = HTTP::Request->new(GET => $url);
	
        my $res = $self->{ua}->request($req);

	if($res->is_success)
	{
		return decode_json($res->content);
	}
	else
	{
		return $res;
	}

}

=head1 AUTHOR

Squeeks, C<< <squeek at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-webservice::forrst at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WebService::Forrst>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WebService::Forrst


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=WebService::Forrst>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/WebService::Forrst>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/WebService::Forrst>

=item * Search CPAN

L<http://search.cpan.org/dist/WebService::Forrst/>

=back


=head1 LICENSE AND COPYRIGHT

Copyright 2010 Squeeks.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of WebService::Forrst
