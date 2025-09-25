sealed class EndPoints {
  static const String baseUrl = 'https://Admin.altkamel.ly/';
  static const String userUrl = 'user/api/index.php/api/';
  static const String adminUrl = 'admin/api/index.php/api/';

  static const String refreshToken = '';

  /// AUTH
  static const String auth = '${userUrl}auth/';
  static const String login = '${auth}login';
  static const String forgotPassword = '${auth}restorePassword';
  static const String getTokenInfo = '${adminUrl}auth';
  static const String languages = '${adminUrl}resources/languages';
  static const String translations = '${adminUrl}resources/language';
  static const String getRemainingDays = '${userUrl}dashboard';
  static const String invoices = '${userUrl}invoice';
  static const String changeSubscription = '${userUrl}service';
  static const String getProfile = '${userUrl}user';
  static const String getServices = changeSubscription;
  static const String getSessions = '${userUrl}session';
  static const String getTraffic = '${userUrl}traffic';
  static const String redeem = '${userUrl}redeem';
  static const String activate = '${userUrl}activate';
  static const String extend = '${userUrl}extend';
  static const String service = '${userUrl}service';
  static const String extensions = '${userUrl}extensions';

  /// PACKAGES
  static const String packages = '${userUrl}packages';
  static const String payment = '${userUrl}payment';
  static const String document = '${userUrl}document';
  static const String journal = '${userUrl}journal';
  static const String ticket = '${userUrl}ticket';

  /// SUPPORT
  static const String support = 'support';

  /// TICKETS
  static const String tickets = 'tickets';

}
