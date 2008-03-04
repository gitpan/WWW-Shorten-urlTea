use ExtUtils::MakeMaker;

WriteMakefile(
    NAME            => 'WWW::Shorten::urlTea',
    VERSION_FROM    => 'lib/WWW/Shorten/urlTea.pm',
    PREREQ_PM       => { WWW::Shorten => 1.97 },
    # following keywords are supported from 5.005
    ($] >= 5.005 ?
        (ABSTRACT_FROM  => 'lib/WWW/Shorten/urlTea.pm',
         AUTHOR         => 'Brandon Gilmore <brandon@mg2.org>') : ())
);

