## no critic (RequireUseStrict)
package Dist::Zilla::Plugin::Git::ExcludeUntracked;
{
  $Dist::Zilla::Plugin::Git::ExcludeUntracked::VERSION = '0.01';
}

## use critic (RequireUseStrict)
use Moose;

with 'Dist::Zilla::Role::FilePruner';


sub _assemble_untracked_lookup {
    my ( $self ) = @_;

    my @untracked_files = map {
        chomp; $_
    } qx(git ls-files --other);

    return map { $_ => 1 } @untracked_files;
}

sub prune_files {
    my ( $self ) = @_;

    my $zilla            = $self->zilla;
    my @files            = @{ $zilla->files };
    my %untracked_lookup = $self->_assemble_untracked_lookup;

    foreach my $file (@files) {
        if(exists $untracked_lookup{$file->name}) {
            $self->log_debug([ 'pruning %s', $file->name ]);
            $zilla->prune_file($file);
        }
    }
}

__PACKAGE__->meta->make_immutable;

1;



=pod

=head1 NAME

Dist::Zilla::Plugin::Git::ExcludeUntracked - Excludes untracked files from your dist

=head1 VERSION

version 0.01

=head1 SYNOPSIS

  [Git::ExcludeUntracked]

=head1 DESCRIPTION

This L<Dist::Zilla> plugin automatically excludes any files from your
distribution that are not currently tracked by Git.

=head1 SEE ALSO

L<Dist::Zilla>

=begin comment

=over

=item prune_files

=back

=end comment

=head1 AUTHOR

Rob Hoelz <rob@hoelz.ro>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Rob Hoelz.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
https://github.com/hoelzro/dist-zilla-plugin-git-excludeuntracked/issues

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=cut


__END__

# ABSTRACT:  Excludes untracked files from your dist

