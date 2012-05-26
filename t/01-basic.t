use Test::Most;

use Net::OpenStack::Compute;

my $auth_url = 'https://nova-api.trystack.org:5443/v2.0/';

throws_ok(
    sub { Net::OpenStack::Compute->new },
    qr/Missing required arguments/,
    'instantiation with no argument throws an exception'
);

throws_ok(
    sub { Net::OpenStack::Compute->new( auth_url => $auth_url ) },
    qr/Missing required arguments/,
    'instantiation with only auth_url argument throws an exception'
);

throws_ok(
    sub { Net::OpenStack::Compute->new( auth_url => $auth_url, user => 'bar' ) },
    qr/Missing required arguments/,
    'instantiation with only auth_url, user arguments throws an exception'
);

{
    my $noc =    Net::OpenStack::Compute->new( auth_url => $auth_url, user => 'bar', password => '123' );
    isa_ok($noc, 'Net::OpenStack::Compute');
    $noc->create_server({name => 's1', flavorRef => 'salty', imageRef => 'vax9000'});
}

done_testing;
