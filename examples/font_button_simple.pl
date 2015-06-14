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

# toplevel window
my $window = SimpleGtk2->new_window(Name => 'main',
                Title => 'Font Button',
                Size => [400, 200]);
$window->add_signal_handler('main', 'delete_event', sub {Gtk2->main_quit;});

# button
$window->add_font_button(Name => 'font_button', 
                Pos => [20, 40], 
                Font => ["Arial", 12]);

$window->show_and_run();
