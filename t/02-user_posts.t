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


my $userposts = $forrst->user_posts( username => 'kyle' );
is(ref($userposts), 'HASH', 'Retrieved data with username');


done_testing();
