use strict;
use warnings;

package Package::Anon;

use XSLoader;

XSLoader::load(__PACKAGE__);

use Symbol ();

sub add_method {
    my ($self, $name, $code) = @_;

    my $gv = Symbol::gensym;

    *$gv = $code;
    $self->{$name} = *$gv;

    return;
}

1;
