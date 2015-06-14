#!/usr/bin/perl -w

#-----------------------------------------------------------------------
# Copyright (C) 2015 by Thomas Funk <t.funk@web.de>
# 
# This library is free software; you can redistribute it and/or modify it under
# the terms of the GNU Library General Public License as published by the Free
# Software Foundation; either version 2.1 of the License, or (at your option)
# any later version.
# 
# This library is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU Library General Public License for
# more details.
# 
# You should have received a copy of the GNU Library General Public License
# along with this library; if not, write to the Free Software Foundation, Inc.,
# 59 Temple Place - Suite 330, Boston, MA  02111-1307  USA.
#-----------------------------------------------------------------------


use SimpleGtk2;
use strict;

# create a new window
my $window = SimpleGtk2->new_window(Type => 'toplevel', 
                            Name        => 'mainWindow', 
                            Title       => 'Statusbar Example', 
                            Statusbar   => 1,
                            Size        => [150, 300]);
$window->add_signal_handler('mainWindow', 'delete_event', sub {Gtk2->main_quit;});

$window->add_statusbar(Name => 'sbar1',
            Pos     => [0, 0],
            Timeout => 2000);

my $count = 1;

$window->add_button(Name => 'button_push1',
            Pos     => [30, 30], 
            Size    => [90, 25], 
            Title   => "push above"),
$window->add_signal_handler('button_push1', 'clicked', sub {&push_above;});

$window->add_button(Name => 'button_push2',
            Pos     => [30, 70], 
            Size    => [90, 25], 
            Title   => "push below"),
$window->add_signal_handler('button_push2', 'clicked', sub {&push_below;});

$window->add_button(Name => 'button_pop1',
            Pos     => [30, 110], 
            Size    => [90, 25], 
            Title   => "pop last"),
$window->add_signal_handler('button_pop1', 'clicked', sub {&pop_last;});

$window->add_button(Name => 'button_remove1',
            Pos     => [30, 150], 
            Size    => [90, 25], 
            Title   => "remove 3rd"),
$window->add_signal_handler('button_remove1', 'clicked', sub {&remove_3rd;});

$window->add_button(Name => 'button_item1',
            Pos     => [30, 190], 
            Size    => [90, 25], 
            Title   => "del 'item 4'"),
$window->add_signal_handler('button_item1', 'clicked', sub {&del_item4;});


sub push_above {
    my $text = "Item $count";
    $window->set_sb_text('sbar1', $text);
    $count += 1;
}

sub push_below {
    my $text = "Item $count";
    $window->set_sb_text($text);
    $count += 1;
}

sub pop_last {
    $window->remove_sb_text();
}

sub remove_3rd {
    $window->remove_sb_text(3);
}

sub del_item4 {
    $window->remove_sb_text('Item 4');
}


$window->show_and_run();
