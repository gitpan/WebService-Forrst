use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'WebService::Forrst',
    AUTHOR              => q{Squeeks <squeek@cpan.org>},
    VERSION_FROM        => 'lib/WebService/Forrst.pm',
    ABSTRACT_FROM       => 'lib/WebService/Forrst.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),

    PL_FILES            => {},
    
    PREREQ_PM => {
        'Test::More'     => 0.88,
	'LWP'            => 0,
	'URI'            => 0,
	'JSON'           => 2.00,
    },

    MIN_PERL_VERSION => '5.008',

    META_MERGE => {
	resources => {
            homepage   => 'http://github.com/squeeks/WebService-Forrst',
	    repository => 'git://github.com/squeeks/WebService-Forrst.git'
	}
    },

    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'WebService::Forrst-*' },
);
