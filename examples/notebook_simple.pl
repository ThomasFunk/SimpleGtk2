#!/usr/bin/perl -w


use strict;
use SimpleGtk2;

# Toplevel window
my $win = SimpleGtk2->new_window(Name => 'mainWindow', Title => 'Notebook simple', Size => [400, 400],
                                Fixed => 0, ThemeIcon => 'emblem-dropbox-syncing');

# notebook
$win->add_notebook(Name => 'NB1', Pos => [10, 10], Size => [200, 200], Tabs => 'top', scroll => 1, Popup => 1);

$win->add_nb_page(Name => "NB_page1", Pos_n => 0, Title => "0Sabbel", Notebook => 'NB1', Tip => "Blafasel_1");
$win->add_nb_page(Name => "NB_page2", Pos_n => 1, Title => "1Babbel", Notebook => 'NB1', Tip => "Blafasel_2");
$win->add_nb_page(Name => "NB_page3", Pos_n => 3, Title => "3Cabbel", Notebook => 'NB1', Tip => "Blafasel_3");
$win->add_nb_page(Name => "NB_page4", Pos_n => 2, Title => "2Dabbel", Notebook => 'NB1', Tip => "Blafasel_4");
$win->add_nb_page(Name => "NB_page5", Pos_n => 4, Title => "4Eabbel", Notebook => 'NB1', Tip => "Blafasel_5");
$win->add_nb_page(Name => "NB_page6", Pos_n => 5, Title => "5Fabbel", Notebook => 'NB1', Tip => "Blafasel_6");
$win->add_nb_page(Name => "NB_page7", Pos_n => 6, Title => "6Gabbel", Notebook => 'NB1', Tip => "Blafasel_7");

$win->add_button(Name => 'Button', Pos => [10, 345], Size => [80, 40], Title => "_Jup", Tip => 'Bla fasel', Frame => 'NB_page1');
# deactivate first page
$win->set_sensitive("NB_page1", 0);
# change title in second page
$win->set_title("NB_page2", "1Bibbile");

$win->add_button(Name => 'removeButton', Pos => [310, 345], Title => "_Remove", Tip => 'Click removes page 6');
$win->add_signal_handler('removeButton', 'clicked', sub{$win->remove_nb_page('NB_page7');});

$win->show_all();


 
 
