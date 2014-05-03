#!/usr/bin/perl -w

use strict;
use SimpleGtk2;

sub nonModal{
    my $response = shift;
    if ($response eq 'yes') {print "Yes\n";}
    else {print "No\n";}
}

sub Modal {
    my $window = shift;
    my $response = $window->show_msg_dialog('diag1', "Message Type", "Warning");
    if ($response eq 'ok') {print "Ok\n";}
    else {print "Cancel\n";}
}

sub Simple {
    my $window = shift;
    my $response = $window->show_msg_dialog('warning', 'yes-no', "This is a simple one");
    print ucfirst($response) . "\n";
}

# Toplevel window
my $win = SimpleGtk2->new_window(Name => 'mainWindow', Title => 'Message Test', Size => [200, 160]);

# a modal message dialog
$win->add_button(Name => 'Button1', Pos => [60, 10], Size => [80, 40], Title => "_Modal");
$win->add_signal_handler('Button1', 'clicked', sub{\&Modal($win);});

$win->add_msg_dialog(Name => 'diag1', DType => 'ok-cancel', MType => 'warning', Icon => 'gtk-quit');

# a non-modal message dialog
my $FirstMsg = "<span foreground=\"blue\" size=\"x-large\">Message Type</span>";
my $SecondMsg = "<span foreground='red' size=\"small\" style ='italic'>Info box.</span>";

$win->add_button(Name => 'Button2', Pos => [60, 60], Size => [80, 40], Title => "_NonModal");
$win->add_signal_handler('Button2', 'clicked', sub{$win->show_msg_dialog('diag2', $FirstMsg, $SecondMsg);});

$win->add_msg_dialog(Name => 'diag2', DType => 'yes-no', MType => 'info', RFunc => \&nonModal, Modal => 0);

# a simple message dialog
$win->add_button(Name => 'Button3', Pos => [60, 110], Size => [80, 40], Title => "_Simple");
$win->add_signal_handler('Button3', 'clicked', sub{\&Simple($win);});

$win->show_all();


