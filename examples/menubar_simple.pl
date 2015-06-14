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
my $win = SimpleGtk2->new_window(Name => 'mainWindow',
                        Title   => 'Menubar Simple',
                        Size    => [400, 200]);

# menu bar
$win->add_menu_bar(Name => 'menubar1',
        Pos     => [0,0]);

# menu Edit
$win->add_menu(Name => 'menu_edit',
        Title   => '_Edit', 
        Menubar => 'menubar1');

# menu item tearoff
$win->add_menu_item(Name => 'menu_item_toff',
        Type    => 'tearoff',
        Menu    => 'menu_edit',
        Tip     => 'This is a tearoff');
# menu item Save
$win->add_menu_item(Name => 'menu_item_save',
        Icon    => 'gtk-save',
        Menu    => 'menu_edit',
        Tip     => 'This is the Save entry');
# separator
$win->add_menu_item(Name => 'menu_item_sep1',
        Type    => 'separator', 
        Menu    => 'menu_edit');
# menu item with icon
$win->add_menu_item(Name => 'menu_item_icon', 
        Title   => 'Burger',
        Icon    => './1.png',
        Menu    => 'menu_edit',
        Tip     => 'This is the Burger');
# check menu item
$win->add_menu_item(Name => 'menu_item_check',
        Type    => 'check',
        Title   => 'Check em',
        Menu    => 'menu_edit',
        Tip     => 'This is a check menu',
        Active  => 1);
# radio menu item
$win->add_menu_item(Name => 'menu_item_radio1',
        Type    => 'radio',
        Title   => 'First',
        Menu    => 'menu_edit',
        Tip     => 'First radio',
        Group   => 'Yeah',
        Active  => 1);
$win->add_menu_item(Name => 'menu_item_radio2',
        Type    => 'radio',
        Title   => 'Second',
        Menu    => 'menu_edit',
        Tip     => 'Second radio',
        Group   => 'Yeah');
$win->add_menu_item(Name => 'menu_item_radio3',
        Type    => 'radio', 
        Title   => '_Third',
        Menu    => 'menu_edit',
        Tip     => 'Third radio',
        Group   => 'Yeah');


# menu Help
$win->add_menu(Name => 'menu_help',
        Title   => '_Help',
        Justify => 'right',
        Menubar => 'menubar1');
# menu item About (deactivated)
$win->add_menu_item(Name => 'menu_item_about',
        Icon    => 'gtk-help',
        Menu    => 'menu_help',
        Tip     => 'This is the About dialog',
        Sens    => 0);

$win->show_and_run();
