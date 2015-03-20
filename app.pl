use Mojolicious::Lite;

get '/' => { text => 'Hello world from Perl!' };

get '/_ah/health' => { text => 'ok' };
get '/_ah/start' => { text => 'ok' };
get '/_ah/stop' => sub {
    my $self = shift;
    $self->render( text => 'ok' );
    exit;
};

app->start( 'daemon', '-l', 'http://*:8080' );
