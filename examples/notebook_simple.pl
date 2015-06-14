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

# Toplevel window
my $win = SimpleGtk2->new_window(Type => 'toplevel',
                        Name        => 'mainWindow',
                        Title       => 'Notebook simple', 
                        Size        => [400, 400],
                        Fixed       => 0,
                        ThemeIcon   => 'emblem-dropbox-syncing');

# notebook
$win->add_notebook(Name => 'NB1',
        Pos     => [10, 10],
        Size    => [300, 300], 
        Tabs    => 'top', 
        scroll  => 1, 
        Popup   => 1);

$win->add_nb_page(Name => "NB_page1", 
        Pos_n   => 0, 
        Title   => "0Sabbel", 
        Notebook => 'NB1', 
        Tip     => "Blafasel_1");
# deactivate first page
$win->set_sensitive("NB_page1", 0);

$win->add_nb_page(Name => "NB_page2",
        Pos_n   => 1,
        Title   => "1Babbel",
        Notebook => 'NB1',
        Tip     => "Blafasel_2");
# change title in second page
$win->set_title("NB_page2", "1Bibbile");

$win->add_nb_page(Name => "NB_page3",
        Pos_n   => 3,
        Title   => "3Cabbel",
        Notebook => 'NB1',
        Tip     => "Blafasel_3");

$win->add_nb_page(Name => "NB_page4",
        Pos_n   => 2,
        Title   => "2Dabbel",
        Notebook => 'NB1', 
        Tip     => "Blafasel_4");

$win->add_nb_page(Name => "NB_page5", 
        Pos_n   => 4,
        Title   => "4Eabbel",
        Notebook => 'NB1',
        Tip     => "Blafasel_5");
$win->set_font('NB_page5', Family => 'Bernard MT Condensed');
$win->set_font_color('NB_page5','red');

$win->add_nb_page(Name => "NB_page6",
        Pos_n   => 5,
        Title   => "5Fabbel",
        Notebook => 'NB1',
        Tip     => "Blafasel_6");
$win->add_nb_page(Name => "NB_page7",
        Pos_n   => 6, 
        Title   => "6Gabbel",
        Notebook => 'NB1',
        Tip     => "Blafasel_7");

$win->add_button(Name => 'Button',
        Pos => [10, 345],
        Size => [80, 40],
        Title => "_Jup",
        Tip => 'Bla fasel',
        Frame => 'NB_page1');

$win->add_button(Name => 'removeButton',
        Pos => [310, 345],
        Title => "_Remove",
        Tip => 'Click removes page 6');
$win->add_signal_handler('removeButton', 'clicked', sub{$win->remove_nb_page('NB_page7');});

$win->show_and_run();


 
 
