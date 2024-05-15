import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart' as intl;
import 'package:student_portal_app/core/utils/screen_util.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:another_flushbar/flushbar_route.dart';


import '../app_theme.dart';

double sameOnRotate({
  required double divideOn,
}) {
  return ScreenUtil.orientation == Orientation.portrait
      ? ScreenUtil.screenWidth / divideOn
      : ScreenUtil.screenHeight / divideOn;
}

void showAppModel({
  required BuildContext context,
  required Widget body,
  bool allowPop = true,
}) async {
  await showDialog(
      context: context,
      builder: (_) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(allowPop);
          },
          child: Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: body,
          ),
        );
      });
}

bool isNumeric(String? s) {
  if (s == null) {
    return false;
  }
  return int.tryParse(s) != null;
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String get toTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension MyIterable<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    final list = where(test);
    return list.isEmpty ? null : list.first;
  }
}

extension Unique<E, Id> on List<E> {
  List<E> unique([Id Function(E element)? id, bool inPlace = true]) {
    final ids = <dynamic>{};
    var list = inPlace ? this : List<E>.from(this);
    list.retainWhere((x) => ids.add(id != null ? id(x) : x as Id));
    return list;
  }
}

String? parsePhone(String phone) =>
    (phone.isNotEmpty) ? (phone.startsWith('967') ? phone : '967$phone') : null;

String parseBase64(Uint8List image) =>
    'data:image/png;base64,${base64.encode(image)}';

// void updateLanguage(Locale locale) {
//   Get.updateLocale(locale).then((value) {
//     DrawerMenuItems.initMenuItems();
//     PostAndCommentMenuItems.initMenuItems();
//     ChoiceChips.initFiltersList();
//     FilterChips.initAll();
//   });
// }

Future<void> showSuccessFlushBar(
    {required String message, required BuildContext context}) async {
  await showFlushBar(message, error: false, context: context);
}

Future<void> showFlushBar(String message,
    {bool error = true,
    bool info = false,
    Duration? duration,
    required BuildContext context}) async {
  await Flushbar(
    flushbarPosition: FlushbarPosition.BOTTOM,
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(8.0),
    icon: const Icon(
      Icons.error,
      color: Colors.white,
    ),
    backgroundColor: info
        ? AppTheme.alertColor
        : error
            ? Theme.of(context).colorScheme.error
            : Get.isDarkMode
                ? AppTheme.darkSuccessColor
                : AppTheme.successColor,
    message: message,
    messageColor: info ? AppTheme.alertColor : Colors.white,
    duration: duration ?? const Duration(milliseconds: 2500),
    boxShadows: [
      BoxShadow(
          color: Colors.black54.withOpacity(.05),
          blurRadius: 2,
          spreadRadius: 4,
          offset: const Offset(2, 2))
    ],
  ).show(Get.context!);
}

Color flowColor({flow}) {
  if (flow == '+') {
    return Colors.green;
  } else {
    return Colors.red;
  }
}

// void showModelImage(
//     {required BuildContext context, required String image, dynamic tag}) async {
//   await showDialog(
//       context: context,
//       builder: (_) {
//         return Center(
//           child: Container(
//             height: ScreenUtil.screenHeight / 1.6,
//             padding: const EdgeInsets.all(24.0),
//             child: FittedBox(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8.0),
//                 child: Container(
//                   padding: const EdgeInsets.all(10.0),
//                   color: Theme.of(context).colorScheme.secondary,
//                   child: Hero(tag: tag, child: cachedNetworkImage(image)),
//                 ),
//               ),
//             ),
//           ),
//         );
//       });
// }

// Future<UserModel> getCachedUser() async {
//   try {
//     logger.d(sl<LocalDataProvider>()
//         .getSingleValueCachedData(boxName: 'CACHED_USER'));
//     return await Future.value(
//       UserModel.fromJson(
//         jsonDecode(
//           sl<LocalDataProvider>()
//               .getSingleValueCachedData(boxName: 'CACHED_USER'),
//         ),
//       ),
//     );
//   } catch (e) {
//     logger.e('getCachedUser error', error: e);
//     return await Future.value(UserModel.init());
//   }
// }

// Future<void> logout({bool redirect = false, bool clearCache = true}) async {
//   if (clearCache) {
//     await sl<OAuth>().storage.clear().then((value) async {
//       await sl<LocalDataProvider>()
//           .clearCache(boxName: 'CACHED_USER')
//           .then((value) async {
//         Current.user = UserModel.init();
//       });
//     });
//   }
//   if (redirect) {
//     await Get.offAll(() => LoginScreen(
//           username: Current.user.email,
//         ));
//   }
// }

List<Map<String, Object>> getCountries(context) {
  return [
    {'id': 1, 'name': "Yemen"},
    {'id': 2, 'name': "Saudi Arabia"},
    {'id': 3, 'name': "Egypt"},
  ];
}

List<Map<String, Object>> getCities(context) {
  return [
    {'id': 1, 'name': "Sana'a"},
    {'id': 2, 'name': "Alhodaida"},
    {'id': 3, 'name': "Aden"},
  ];
}

List<Map<String, Object>> getDistricts(context) {
  return [
    {'id': 1, 'name': "Alsabeen"},
    {'id': 2, 'name': "Maeen"},
    {'id': 3, 'name': "Alwehda"},
  ];
}

// List<Map<String, Object>> getGenders(context) {
//   return [
//     {'id': 1, 'name': AppLocalizations.of(context)!.male},
//     {'id': 2, 'name': AppLocalizations.of(context)!.female},
//   ];
// }
//
// void launchURL(String uri) async {
//   String url() {
//     return uri;
//   }
//
//   try {
//     if (await canLaunchUrl(Uri.parse(url()))) {
//       await launchUrl(Uri.parse(url()));
//     } else {
//       throw 'Could not launch ${url()}';
//     }
//   } catch (e, s) {
//     logger.e('launchURL Error', error: e, stackTrace: s);
//   }
// }
//
// void shareApp(BuildContext context) {
//   String androidAppUrl = sl<FirebaseRemoteConfig>().getString('androidAppUrl');
//   String iOSAppUrl = sl<FirebaseRemoteConfig>().getString('iOSAppUrl');
//   Share.share(
//       AppLocalizations.of(context)!.shareMessage(androidAppUrl, iOSAppUrl));
// }
//
// void checkNewVersionAvailability(BuildContext context) async {
//   final newVersion = NewVersion(
//     iOSId: 'com.google.ebn_balady',
//     androidId: 'co.widespace.ebn_balady',
//   );
//
//   final status =
//       await newVersion.getVersionStatus().onError((error, stackTrace) {
//     logger.d(error);
//     return;
//   });
//   bool forceUpdate = sl<FirebaseRemoteConfig>().getBool('forceUpdate');
//   if (status != null) {
//     if (status.canUpdate) {
//       bool? update = await UpdateAppBottomSheet.show(forceUpdate: forceUpdate);
//       if (update != null) {
//         launchURL(status.appStoreLink);
//         if (forceUpdate) {
//           checkNewVersionAvailability(context);
//         }
//       }
//     }
//   }
// }

// Map<String, String> getAuthHeaders() {
//   return {
//     'Authorization':
//         'Bearer ${sl<OAuthRepository>().fetchImmediately()?.accessToken}'
//   };
// }

// void runMainMenuFeaturesDiscovery(BuildContext context) async {
//   // todo:remove next line later
//   // await FeatureDiscovery.clearPreferences(context, <String>{
//   //   'toggle_balance_visibility',
//   //   'view_notifications',
//   //   'switch_available_wallets',
//   //   'transactions_bottom_bar_action',
//   //   'sub_wallets_bottom_bar_action',
//   //   'activate_client_bottom_bar_action',
//   //   'settings_bottom_bar_action',
//   // });
//   SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
//     FeatureDiscovery.discoverFeatures(
//       context,
//       <String>{
//         // Feature ids for every feature that you want to showcase in order.
//         'toggle_balance_visibility',
//         'view_notifications',
//         'switch_available_wallets',
//         'transactions_bottom_bar_action',
//         // if (Current.user.isNotAgent) ...{
//         //   'sub_wallets_bottom_bar_action',
//         // },
//         // if (Current.user.isAgent) ...{
//         //   'activate_client_bottom_bar_action',
//         // },
//         'settings_bottom_bar_action',
//       },
//     );
//   });
// }

// void runTransactionSheetFeaturesDiscovery(BuildContext context) async {
//   // todo:remove next line later
//   // await FeatureDiscovery.clearPreferences(context, <String>{
//   //   'print_transaction',
//   //   'share_transaction',
//   // });
//   SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
//     FeatureDiscovery.discoverFeatures(
//       context,
//       <String>{
//         'print_transaction',
//         'share_transaction',
//       },
//     );
//   });
// }

// void runWalletsDialogFeaturesDiscovery(BuildContext context) async {
//   // todo:remove next line later
//   // await FeatureDiscovery.clearPreferences(context, <String>{
//   //   'add_wallet',
//   // });
//   SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
//     FeatureDiscovery.discoverFeatures(
//       context,
//       <String>{
//         'add_wallet',
//       },
//     );
//   });
// }

// void runSettingFeaturesDiscovery(BuildContext context) async {
//   // todo:remove next line later
//   // await FeatureDiscovery.clearPreferences(context, <String>{
//   //   'biometric_login',
//   // });
//   SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
//     FeatureDiscovery.discoverFeatures(
//       context,
//       <String>{
//         'biometric_login',
//       },
//     );
//   });
// }

bool isProbablyArabic(String s) {
  for (int i = 0; i < s.length; i++) {
    int c = s.codeUnitAt(i);
    if (c >= 0x0600 && c <= 0x06E0) {
      return true;
    }
  }
  return false;
}

// void launchMap({required LatLng origin, required LatLng destination}) async {
//   String mapOptions = [
//     'saddr=${origin.latitude},${origin.longitude}',
//     'daddr=${destination.latitude},${destination.longitude}',
//     'dir_action=navigate',
//   ].join('&');
//   // final url = 'google.navigation:q=${destination.latitude},${destination.longitude}&mode=d';
//   final url = 'https://www.google.com/maps?$mapOptions';
//
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw ('Could not launch $url');
//   }
// }

// Future<bool> isDeviceEligibleToUseTheApp(
//     {required BuildContext context}) async {
//   if (await FlutterJailbreakDetection.jailbroken) {
//     await showFlushBar(AppLocalizations.of(Get.context!)!.jailBrokenDeviceAlert,
//         context: context);
//     return false;
//   }
//
//   final deviceInfo = await (Platform.isAndroid
//       ? DeviceInfoPlugin().androidInfo
//       : DeviceInfoPlugin().iosInfo);
//   bool isAndroidEmulator =
//       (deviceInfo is AndroidDeviceInfo && !(deviceInfo.isPhysicalDevice));
//   bool isIOSEmulator =
//       (deviceInfo is IosDeviceInfo && !deviceInfo.isPhysicalDevice);
//
//   if (isAndroidEmulator || isIOSEmulator) {
//     await showFlushBar(AppLocalizations.of(Get.context!)!.emulatorDeviceAlert,
//         context: context);
//     return false;
//   }
//
//   return true;
// }

bool isRTL(String text, BuildContext context) {
  if (text.isEmpty) {
    return Directionality.of(context) == TextDirection.rtl;
  }
  return intl.Bidi.detectRtlDirectionality(text);
}
