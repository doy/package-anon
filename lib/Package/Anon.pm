use strict;
use warnings;

package Package::Anon;

use base 'Package::Stash';

use XSLoader;

XSLoader::load(__PACKAGE__);

sub new {
    my $class = shift;
    my ($name) = @_;

    my $stash = $class->_new_anon_stash(@_);
    my $self = $class->SUPER::new($name || '__ANON__');

    $self->{anon_namespace} = $stash;
    $self->{anon_name} = $name;

    return $self;
}

sub name      { $_[0]->{anon_name}      }
sub namespace { $_[0]->{anon_namespace} }

sub add_method {
    my ($self, $name, $code) = @_;

    $self->add_symbol('&' . $name, $code);

    return;
}

1;
