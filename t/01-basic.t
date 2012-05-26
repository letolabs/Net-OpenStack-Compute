use Test::Most;

use Net::OpenStack::Compute;

throws_ok(
    sub { Net::OpenStack::Compute->new },
    qr/Missing required arguments/,
    'instantiation with no argument throws an exception'
);

throws_ok(
    sub { Net::OpenStack::Compute->new( auth_url => 'foo' ) },
    qr/Missing required arguments/,
    'instantiation with only auth_url argument throws an exception'
);

throws_ok(
    sub { Net::OpenStack::Compute->new( auth_url => 'foo', user => 'bar' ) },
    qr/Missing required arguments/,
    'instantiation with only auth_url, user arguments throws an exception'
);

my $noc =    Net::OpenStack::Compute->new( auth_url => 'foo', user => 'bar', password => '123' );
isa_ok($noc, 'Net::OpenStack::Compute');

done_testing;
