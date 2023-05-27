import 'package:intl/intl.dart';

abstract class Strings {
  static final app = AppStrings();
  static final common = CommonStrings();
  static final home = HomeStrings();
  static final planter = PlanterStrings();
  static final trial = TrialStrings();
  static final planting = PlantingStrings();
  static final preparation = PreparationStrings();
  static final snr = SnrStrings();
  static final smr = SmrStrings();
  static final soil = SoilStrings();
  static final species = SpeciesStrings();
  static final error = ErrorStrings();
  static final permission = PermissionStrings();
  static final logout = LogoutDialogStrings();
  static final notifications = NotificationsStrings();
  static final bgTask = BgDebugStrings();
  static final debug = DebugStrings();
  static final log = LogsStrings();
}

class AppStrings {
  String name() => Intl.message('GOM Trials');
}

class CommonStrings {
  String nonMandatory() => Intl.message('Optional field');
}

class HomeStrings {
  String title() => Intl.message('Establish Guinness-o-metric Trial');

  String planting() => Intl.message('Record\nTrial');

  String trial() => Intl.message('Add/Edit\nTrial Info');

  String planter() => Intl.message('Setup\nPlanter');

  String successSending() => Intl.message('Trial info successfully sent.');

  String defaultErrorSending() => Intl.message('Send error.');

  String errorSendingButton() => Intl.message('Retry');

  String sendingTitle() => Intl.message('Sending');
}

class PlanterStrings {
  String title() => Intl.message('Edit planter');

  String titleCreating() => Intl.message('Registration');

  String nickname() => Intl.message('Planter ID');

  String organization() => Intl.message('Company/Organization');

  String lastName() => Intl.message('Last name');

  String firstName() => Intl.message('First name');

  String email() => Intl.message('Email');

  String phone() => Intl.message('Phone');

  String button() => Intl.message('Save planter');

  String buttonCreating() => Intl.message('Register planter');

  String logoutButton() => Intl.message('Sign out');
}

class TrialStrings {
  String title() => Intl.message('Add trial');

  String trialTitle() => Intl.message('Trial');

  String trialNickname() => Intl.message('Trial ID');

  String contactTitle() => Intl.message('Contact');

  String contactId() => Intl.message('Trial contact ID');

  String organization() => Intl.message('Company/Organization');

  String lastName() => Intl.message('Last name');

  String firstName() => Intl.message('First name');

  String email() => Intl.message('Email');

  String phone() => Intl.message('Phone');

  String objective() => Intl.message('Objective');

  String button() => Intl.message('Save trial');
}

class PlantingStrings {
  final site = SiteInfoStrings();
  final seedlings = SeedlingsInfoStrings();

  String title() => Intl.message('New Planting Site');

  String button() => Intl.message('Send planting info');

  String blockTitle() => Intl.message('Planting info');

  String trialNickname() => Intl.message('Trial ID');

  String contactId() => Intl.message('Trial contact ID');

  String plantingId() => Intl.message('Plantation ID');

  String blockId() => Intl.message('Block ID');

  String date() => Intl.message('Established date');

  String latitude() => Intl.message('Latitude');

  String longitude() => Intl.message('Longitude');

  String elevation() => Intl.message('Elevation, m');

  String locationButton() => Intl.message('Define location');

  String photoButton() => Intl.message('Attach photo');
}

class SiteInfoStrings {
  String title() => Intl.message('Site info');

  String series() => Intl.message('Site series');

  String smr() => Intl.message('SMR');

  String snr() => Intl.message('SNR');

  String soil() => Intl.message('Soil/site factors');

  String preparation() => Intl.message('Site preparation');
}

class SeedlingsInfoStrings {
  String title() => Intl.message('Seedlings info');

  String count() => Intl.message('Number of seedlings');

  String species() => Intl.message('Species');

  String seedlot() => Intl.message('Seedlot');

  String spacing() => Intl.message('Spacing, m');

  String notes() => Intl.message('Planting notes');
}

class PreparationStrings {
  String spotBurn() => Intl.message('Spot Burn');

  String mechanicalAndSpotBurn() => Intl.message('Mechanical & Spot Burn');

  String mMechanical() => Intl.message('Mechanical');

  String grassSeeded() => Intl.message('Grass Seeded');

  String chemical() => Intl.message('Chemical');

  String broadcastBurn() => Intl.message('Broadcast Burn');
}

class SnrStrings {
  String veryPoor() => Intl.message('Very poor');

  String poor() => Intl.message('Poor');

  String medium() => Intl.message('Medium');

  String rich() => Intl.message('Rich');

  String veryRich() => Intl.message('Very rich');
}

class SmrStrings {
  String veryXeric() => Intl.message('VX; very xeric');

  String xeric() => Intl.message('X; xeric');

  String subxeric() => Intl.message('SX; subxeric');

  String submesic() => Intl.message('SM; submesic');

  String mesic() => Intl.message('M; mesic');

  String subhygric() => Intl.message('SHG; subhygric');

  String hygric() => Intl.message('HG; hygric');

  String subhydric() => Intl.message('SHD; subhydric');

  String hydric() => Intl.message('HD; hydric');
}

class SoilStrings {
  String compactedMorainalMaterial() => Intl.message('Compacted morainal material');

  String stronglyCementedHorizon() => Intl.message('Strongly cemented horizon');

  String lithicContact() => Intl.message('Lithic contact (thin soils)');

  String excessiveMoisture() => Intl.message('Excessive moisture');

  String permafrost() => Intl.message('Permafrost');

  String fragmental() => Intl.message('Fragmental (very rocky)');

  String snowAccumulation() => Intl.message('Snow Accumulation');

  String wind() => Intl.message('Wind');

  String saltSpray() => Intl.message('Salt spray');

  String frost() => Intl.message('Frost');

  String insolation() => Intl.message('Insolation');

  String coldAirDrainage() => Intl.message('Cold air drainage');
}

class SpeciesStrings {
  String oa() => Intl.message('Oa. Cedar, incense');

  String fd() => Intl.message('Fd. Douglas-fir');

  String fdc() => Intl.message('Fdc. Douglas-fir, coast');

  String fdi() => Intl.message('Fdi. Douglas-fir, Rocky Mountain');

  String ba() => Intl.message('Ba. Fir, amabilis');

  String bb() => Intl.message('Bb. Fir, balsam');

  String bg() => Intl.message('Bg. Fir, grand');

  String bp() => Intl.message('Bp. Fir, noble');

  String bm() => Intl.message('Bm. Fir, red');

  String bl() => Intl.message('Bl. Fir, subalpine');

  String bc() => Intl.message('Bc. Fir, white');

  String hm() => Intl.message('Hm. Hemlock, mountain');

  String hw() => Intl.message('Hw. Hemlock, western');

  String ld() => Intl.message('Ld. Larch, Dahurian');

  String ls() => Intl.message('Ls. Larch, Siberian');

  String la() => Intl.message('La. Larch, subalpine');

  String lw() => Intl.message('Lw. Larch, western');

  String pj() => Intl.message('Pj. Pine, jack');

  String pf() => Intl.message('Pf. Pine, limber');

  String pl() => Intl.message('Pl. Pine, lodgepole');

  String pli() => Intl.message('Pli. Pine, lodgepole');

  String pm() => Intl.message('Pm. Pine, Monterey');

  String py() => Intl.message('Py. Pine, ponderosa');

  String pr() => Intl.message('Pr. Pine, red');

  String plc() => Intl.message('Plc. Pine, shore');

  String ps() => Intl.message('Ps. Pine, sugar');

  String pw() => Intl.message('Pw. Pine, western white');

  String pa() => Intl.message('Pa. Pine, whitebark');

  String yp() => Intl.message('Yp. Port Orford-cedar');

  String cw() => Intl.message('Cw. Redcedar, western');

  String oc() => Intl.message('Oc. Redwood, coast');

  String ob() => Intl.message('Ob. Sequoia, giant');

  String sb() => Intl.message('Sb. Spruce, black');

  String se() => Intl.message('Se. Spruce, Engelmann');

  String sn() => Intl.message('Sn. Spruce, Norway');

  String ss() => Intl.message('Ss. Spruce, Sitka');

  String sw() => Intl.message('Sw. Spruce, white');

  String lt() => Intl.message('Lt. Tamarack');

  String yc() => Intl.message('Yc. Yellow-cedar');

  String tw() => Intl.message('Tw. Yew, Pacific');

  String dr() => Intl.message('Dr. Alder, red');

  String ra() => Intl.message('Ra. Arbutus, Pacific');

  String og() => Intl.message('Og. Ash, Oregon');

  String oh() => Intl.message('Oh. Ash, white');

  String at() => Intl.message('At. Aspen, trembling');

  String ep() => Intl.message('Ep. Birch, paper');

  String ac() => Intl.message('Ac. Cottonwood, black');

  String ad() => Intl.message('Ad. Cottonwood, eastern plains');

  String oi() => Intl.message('Oi. Hickory, shagbark');

  String mb() => Intl.message('Mb. Maple, bigleaf');

  String qg() => Intl.message('Qg. Oak, Garry');

  String qw() => Intl.message('Qw. Oak, white');
}

class ErrorStrings {
  String title() => Intl.message('Error');

  String defaultMessage() => Intl.message('Unknown error');

  String openSettings() => Intl.message('Open settings');

  String close() => Intl.message('OK');

  String incorrectEmail() => Intl.message('Incorrect email');

  String incorrectPhone() => Intl.message('Incorrect phone');

  String isEmpty() => Intl.message('Required field');

  String isNull() => Intl.message('Required field');

  String incorrectLongitude() => Intl.message('Incorrect longitude');

  String incorrectLatitude() => Intl.message('Incorrect latitude');

  String photoEmpty() => Intl.message('Need to add one or more photos.');

  String noConnection() => Intl.message('Failed connection.');
}

class PermissionStrings {
  String location() => Intl.message('To continue using the application, we need access to your geolocation.');

  String gallery() => Intl.message('To continue using the application, we need access to your gallery.');
}

class LogoutDialogStrings {
  String title() => Intl.message('Sign out');

  String text() => Intl.message('Are you sure you want to sign out of this planter?');

  String ok() => Intl.message('Sign out');

  String cancel() => Intl.message('Cancel');
}

class NotificationsStrings {
  String baseChannelTitle() => Intl.message('Base notification channel.');

  String baseChannelDescription() => Intl.message('Channel to send the status of the synchronization process.');

  String successTitle() => Intl.message('Data is synced.');

  String successMessage(int count) => Intl.plural(
        count,
        other: '$count objects were synchronized successfully',
        one: '$count object was synchronized successfully',
        args: [count],
        name: 'Success sync message.',
        desc: 'Information about the success of synchronization, which contains the number of synchronized objects.',
        examples: {
          'count': 10,
        },
      );

  String errorTitle() => Intl.message('Data sync error.');

  String errorMessage(int success, int count) => Intl.plural(
        success,
        other: 'Only $success objects out of $count are successfully synchronized.',
        zero: errorMessageWithZeroSuccess(count),
        one: 'Only $success object out of $count is successfully synchronized.',
        args: [count, success],
        name: 'Error sync message.',
        desc:
            'Information about the error of synchronization that contains the number of synchronized objects and the number of objects that tried to synchronize.',
        examples: {
          'count': 10,
          'success': 3,
        },
      );

  String errorMessageWithZeroSuccess(int count) => Intl.plural(
        count,
        other: 'Synchronization of $count objects is stopped by an error',
        one: 'Synchronization of $count object is stopped by an error',
        args: [count],
        name: 'Error sync message.',
        desc: 'Error sync message with information about count of all objects',
        examples: {
          'count': 10,
        },
      );
}

class BgDebugStrings {
  String title() => Intl.message('Background task debug');
}

class DebugStrings {
  String title() => Intl.message('Debug tools');

  String logs() => Intl.message('Log files');

  String bgDebug() => Intl.message('Background task debug');
}

class LogsStrings {
  String title() => Intl.message('Log files');

  String message() => Intl.message('Log files');
}
