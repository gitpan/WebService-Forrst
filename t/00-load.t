#!perl -T

use strict;
use warnings;

use Test::More tests => 1;

BEGIN {
    use_ok( 'WebService::Forrst' ) || print "Bail out!\n";
}

diag( "Testing WebService::Forrst $WebService::Forrst::VERSION, Perl $], $^X" );
diag( "To enable the full test suite to complete, please set the environment variable WEBSERVICE_FORRST to 1." );
