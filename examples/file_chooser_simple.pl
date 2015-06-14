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


my $win = SimpleGtk2->new_window(Name => 'mainWindow',
                        Title => 'File Choosers',
                        Size => [200, 180]);

# show the recent used files
$win->add_filechooser_button(Name => 'FButton1',
            Pos     => [40, 20],
            Size    => [120, 40],
            Title   => "Select a file",
            Action  => 'open');

# show only images. Start folder is ~/Pictures
$win->add_filechooser_button(Name => 'FButton2',
            Pos     => [40, 70],
            Size    => [120, 40],
            Title   => "Select an image",
            Action  => 'open',
            Folder  => "$ENV{HOME}/Pictures",
            Filter  => ['Images', '*.png']);

# show folder only
$win->add_filechooser_button(Name => 'FButton3',
            Pos => [40, 120],
            Size => [120, 40],
            Title => "Select a folder",
            Action => 'select-folder',
            Folder => '/home',
            Filter => '*.txt');

$win->show_and_run();
