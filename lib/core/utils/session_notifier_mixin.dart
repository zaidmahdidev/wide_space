// import 'package:flutter/cupertino.dart';
// import 'package:hive/hive.dart';
//
// import '../../injection_container.dart';
// import '../constants.dart';
// import 'common_utils.dart';
//
// enum SessionStatus {
//   active,
//   disabled,
// }
//
// mixin SessionMixin<T extends StatefulWidget>
//     on State<T>, WidgetsBindingObserver {
//   static SessionStatus sessionStatus = SessionStatus.disabled;
//
//   final _lastKnownStateKey = 'lastKnownStateKey';
//   final _backgroundedTimeKey = 'backgroundedTimeKey';
//   final _pinLockMillis = 30000;
//   final _temp = Hive.box(cacheBoxName);
//
//   @override
//   void initState() {
//     logger.d('session AppLifecycleState:initState');
//     WidgetsBinding.instance.addObserver(this);
//     Future.delayed(
//       const Duration(seconds: 1),
//       () => sessionStatus = SessionStatus.disabled,
//     );
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     logger.d('session AppLifecycleState:dispose');
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     super.didChangeAppLifecycleState(state);
//
//     if (sessionStatus == SessionStatus.disabled) return;
//
//     switch (state) {
//       case AppLifecycleState.resumed:
//         _resumed();
//         break;
//       case AppLifecycleState.paused:
//         _paused();
//         break;
//       case AppLifecycleState.inactive:
//         _inactive();
//         break;
//       case AppLifecycleState.detached:
//         // TODO: Handle this case.
//         break;
//       case AppLifecycleState.hidden:
//         // TODO: Handle this case.
//         break;
//     }
//   }
//
//   Future _paused() async {
//     logger.d('session _paused');
//
//     await _temp.put(_lastKnownStateKey, AppLifecycleState.paused.index);
//   }
//
//   Future _inactive() async {
//     logger.d('session inactive');
//     final prevState = _temp.get(_lastKnownStateKey);
//     final prevStateIsNotPaused = prevState != null &&
//         AppLifecycleState.values[prevState] != AppLifecycleState.paused;
//     if (prevStateIsNotPaused) {
//       await _temp.put(
//           _backgroundedTimeKey, DateTime.now().millisecondsSinceEpoch);
//     }
//     await _temp.put(_lastKnownStateKey, AppLifecycleState.inactive.index);
//   }
//
//   Future _resumed() async {
//     logger.d('session resumed');
//
//     final bgTime = _temp.get(_backgroundedTimeKey) ?? 0;
//     final allowedBackgroundTime = bgTime + _pinLockMillis;
//     final shouldExit =
//         DateTime.now().millisecondsSinceEpoch > allowedBackgroundTime;
//     logger.d('session Available Time');
//     logger.d('shouldExit: $shouldExit');
//     logger.d(
//         DateTime.fromMillisecondsSinceEpoch(allowedBackgroundTime).toString());
//     if (shouldExit) {
//       await Future.microtask(() async {
//         sessionStatus = SessionStatus.disabled;
//         await logout(redirect: true, clearCache: false);
//         // Navigator.of(context).popUntil((route) => route.isFirst);
//       });
//     }
//
//     await _temp.delete(_backgroundedTimeKey);
//     await _temp.put(_lastKnownStateKey, AppLifecycleState.resumed.index);
//   }
// }
