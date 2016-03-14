package MooseX::MojoControllerExposingAttributes::Role::Class;
use Moose::Role;

our $VERSION = '1.000000';

sub controller_method_name {
    my $self = shift;
    my $what = shift;

    # the meta information about what attributes are accessible is
    # unsurprisingly stored in the meta class
    return $self->meta->get_read_method_name_for_mojo_helper($what);
}

1;

=head1 SYNOPSIS

   package MyApp::Controller::Example;
   use MooseX::MojoControllerExposingAttributes;  # applies this role!

   ...

=head1 DESCRIPTION

This is a role that is designed to be consumed by Mojolicious::Controller
subclasses to provide them with the C<controller_method_name> method that is
required by the C<ctrl> helper.  This method simply asks the consumer's
metaclass what the correct read method is for the attribute exposed to
Mojolicious as the passed value is.

You don't want to manually consume this role, but rather use the
L<MMooseX::MojoControllerExposingAttributes> module to set things up for you.

=head1 SEE ALSO

L<MooseX::MojoControllerExposingAttributes>

