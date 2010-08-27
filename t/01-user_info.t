#!perl -T

use strict;
use warnings;

use Test::More;
unless ( $ENV{WEBSERVICE_FORRST} )
{
    plan( skip_all => "Environment variable WEBSERVICE_FORRST not set" );
}

use_ok( 'WebService::Forrst' );


my $forrst = WebService::Forrst->new;
ok($forrst, 'New WebService::Forrst object');


my $username = $forrst->user_info( username => 'kyle' );
is(ref($username), 'HASH', 'Retrieved data with username');


my $userid = $forrst->user_info( id  => '1' );
is(ref($userid), 'HASH', 'Retrieved data with userid');


done_testing();
