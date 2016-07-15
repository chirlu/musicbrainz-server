package MusicBrainz::Server::Entity::URL::Discogs;

use Moose;

extends 'MusicBrainz::Server::Entity::URL';
with 'MusicBrainz::Server::Entity::URL::Sidebar';

sub pretty_name {
    return 'Discogs: ' . shift->sidebar_name;
}

sub sidebar_name {
    my $self = shift;

    my $path = substr $self->decoded_local_part, 1; # without the leading slash
    my ($type, $id) = $path =~ m{^(artist|label|relase|master)/([0-9]+)$}
        or return $path;

    return (substr $type, 0, 1) . $id;
}


__PACKAGE__->meta->make_immutable;
no Moose;
1;

=head1 COPYRIGHT

Copyright (C) 2010 MetaBrainz Foundation
Copyright (C) 2016 Ulrich Klauer

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

=cut
