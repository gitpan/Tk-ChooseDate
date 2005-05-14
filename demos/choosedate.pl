#ChooseDate ** A popup calendar widget **

use Tk;
use Tk::ChooseDate;

use vars qw/$TOP/;
use subs qw/choosedate_getdate/;
use vars qw/$cd_mod $cd_date $cd_button $cd_label/;

sub choosedate {
  my ($demo) = @_;
  my $text = qq/
Popup calendar for choosing
dates quickly. Although there
is only read-only access
via the widget, the get and
set methods allow one to
retrieve and change
the date programmatically.
/;
  $TOP = $MW->WidgetDemo(
    -name             => $demo,
    -text             => $text,
    -title            => 'ChooseDate Demonstration',
    -iconname         => 'ChooseDate',
    -geometry_manager => 'grid',
  );

  $cd_mod = $TOP->ChooseDate->grid(-sticky =>'ew');
  $cd_button = $TOP->Button(-text=>"Get Date", -command=>\&choosedate_getdate)->grid( -sticky => 'nsew' );
  $cd_label = $TOP->Label(-text=>undef)->grid(-sticky=>'ew');

}

sub choosedate_getdate
{
  $cd_date = $cd_mod->get;
  $cd_label->configure(-text=>$cd_date);
}

return 1 if caller();

require WidgetDemo;

$MW = new MainWindow;
$MW->geometry("+0+0");
$MW->Button(
  -text    => 'Close',
  -command => sub { $MW->destroy }
)->pack;
choosedate('choosedate');
MainLoop;
