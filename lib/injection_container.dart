import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
// import 'package:ebn_balady/core/network/network_info.dart';
// import 'package:ebn_balady/features/map/presentation/states%20manager/map_bloc.dart';
// import 'package:ebn_balady/features/notifications/presentation/states%20manager/notification_bloc.dart';
// import 'package:ebn_balady/features/on_bording/states%20manager/locale_cubit.dart';
// import 'package:ebn_balady/features/posts/data/repositories/comments_repository.dart';
// import 'package:ebn_balady/features/posts/presentation/states%20manager/comments_bloc/comments_bloc.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
// import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:oauth_dio/oauth_dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:student_portal_app/features/login/data/repository/login_repo.dart';
import 'package:student_portal_app/features/login/persentation/management/bloc/user_bloc.dart';
import 'package:timeago/timeago.dart' as time_ago;

import 'core/constants.dart';
import 'core/data_providers/local_data_provider.dart';
import 'core/data_providers/remote_data_provider.dart';
import 'core/network/data_source_url.dart';
import 'core/network/network_info.dart';
// import 'features/posts/data/repositories/posts_repository.dart';
// import 'features/posts/presentation/states manager/comment_like_bloc/comment_like_bloc.dart';
// import 'features/posts/presentation/states manager/like_bloc/like_bloc.dart';
// import 'features/posts/presentation/states manager/post_ bloc/post_bloc.dart';
// import 'features/posts/presentation/states manager/posts_bloc/posts_bloc.dart';
// import 'features/user/data/repositories/oauth_repository.dart';
// import 'features/user/data/repositories/user_repository.dart';
// import 'features/user/presentation/manager/user_bloc.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart/';

import 'features/login/data/repository/oauth_repository.dart';

final sl = GetIt.instance;
Logger logger = Logger();
bool enableLoggerDebugMode = true;

Future<void> initialize() async {
/*
* Core
*/

  // init network
  sl.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfo(connectionChecker: sl.get<InternetConnectionChecker>()));
  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  // init theme and orientation

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // For Android.
    // Use [light] for white status bar and [dark] for black status bar.
    statusBarIconBrightness: Brightness.light,
    // For iOS.
    // Use [dark] for white status bar and [light] for black status bar.
    statusBarBrightness: Brightness.dark,
  ));
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // init firebase
  // await Firebase.initializeApp();

  // init remote config
  await _initializeRemoteConfig();

  // init notifications
  // _initNotifications();

  // init utils
  _initUtils();

  // init hive
  await Hive.initFlutter();
  await _initializeHiveBoxes();

  // register package-info
  sl.registerSingleton<PackageInfo>(await PackageInfo.fromPlatform());

  // init dio
  await _initializeDio();

  // init language cubit
  // sl.registerFactory<LocaleCubit>(() => LocaleCubit());

  // init dataSources
  sl.registerLazySingleton<LocalDataProvider>(() => LocalDataProvider());
  sl.registerLazySingleton<RemoteDataProvider>(() => RemoteDataProvider(
      client: sl.get<Dio>(), cacheAgent: sl.get<LocalDataProvider>()));

//  ! Features
//   _initPostsFeature();
  _initUserFeature();
//   _initMapFeature();
}

// void _initPostsFeature() {
//   sl.registerLazySingleton<PostsRepository>(() => PostsRepository());
//   sl.registerLazySingleton<CommentsRepository>(() => CommentsRepository());
//
//   sl.registerFactory<PostsBloc>(
//           () => PostsBloc(postsRepository: sl.get<PostsRepository>()));
//
//   sl.registerFactory<PostBloc>(() => PostBloc(
//     postsRepository: sl.get<PostsRepository>(),
//   ));
//
//   sl.registerFactory<LikeBloc>(
//           () => LikeBloc(postsRepository: sl.get<PostsRepository>()));
//
//   sl.registerFactory<CommentsBloc>(
//           () => CommentsBloc(commentsRepository: sl.get<CommentsRepository>()));
//
//   sl.registerFactory<CommentLikeBloc>(
//           () => CommentLikeBloc(commentsRepository: sl.get<CommentsRepository>()));
// }

void _initUserFeature() {
  if (!GetIt.instance.isRegistered<UserBloc>()) {
    GetIt.instance.registerFactory<UserBloc>(
        () => UserBloc(loginRepository: LoginRepository()));
  }
}

// void _initMapFeature() {
//   sl.registerFactory(() => MapBloc());
// }

Future _initializeHiveBoxes() async {
  return Future.value(const FlutterSecureStorage()).then((secureStorage) async {
    /// Create new encryption key if not exists
    if (!await secureStorage.containsKey(key: 'key')) {
      var key = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64Url.encode(key));
    }

    // Load encryptionKey
    var encryptionKey =
        base64Url.decode(await secureStorage.read(key: 'key') ?? '');

    await Hive.openBox(
      'AUTH_CACHE_BOX',
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
    await Hive.openBox(
      'CACHED_LANGUAGE',
    );
    await Hive.openBox(
      'IS_DARK_MODE',
    );
    await Hive.openBox(
      'CACHED_USER',
    );
    await Hive.openBox(
      'CACHED_USERS',
    );
    await Hive.openBox(
      'CACHED_POSTS',
    );
    await Hive.openBox(
      'USE_LOCAL_AUTH',
    );
    await Hive.openBox(
      'SESSION_BOX',
    );
  });
}

Future _initializeRemoteConfig() async {
  return Future.value(FirebaseRemoteConfig.instance).then<FirebaseRemoteConfig>(
    (remoteConfig) async {
      await remoteConfig.setDefaults(
        json.decode(await rootBundle.loadString(configPath)),
      );

      try {
        await remoteConfig.setConfigSettings(RemoteConfigSettings(
            fetchTimeout: const Duration(seconds: 10),
            minimumFetchInterval: const Duration(minutes: 30)));
        await remoteConfig.fetchAndActivate();
        // Start fetching new config in background
      } catch (_) {}

      return remoteConfig;
    },
  ).then(sl.registerSingleton);
}

Future _initializeDio() async {
  String? token;

  if (!Platform.isWindows) {
    // ignore:unawaited_futures
    FirebaseMessaging.instance.getToken().then((value) => token = value);
  }
  final deviceInfo = await (Platform.isAndroid
      ? DeviceInfoPlugin().androidInfo
      : DeviceInfoPlugin().iosInfo);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      responseType: ResponseType.json,
      headers: {
        'Accept': 'application/json',
        'content-type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        'x-platform': 'mobile',
        'x-locale':
            Get.locale?.languageCode ?? Get.deviceLocale?.languageCode ?? 'ar',
        if (deviceInfo is AndroidDeviceInfo) ...{
          'x-device-id': deviceInfo.id,
          'x-device-brand': deviceInfo.brand,
          'x-device-model': deviceInfo.model,
          'x-device-os': 'android',
          'x-device-os-version': deviceInfo.version.release,
        } else if (deviceInfo is IosDeviceInfo) ...{
          'x-device-id': deviceInfo.identifierForVendor,
          'x-device-brand': 'apple',
          'x-device-model': deviceInfo.utsname.machine,
          'x-device-os': 'ios',
          'x-device-os-version': deviceInfo.systemVersion,
        },
        'x-package-name': sl<PackageInfo>().packageName,
        'x-package-version': sl<PackageInfo>().version,
        'x-package-build-number': sl<PackageInfo>().buildNumber,
      },
    ),
  )..interceptors.addAll(
      [
        LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          logPrint: kDebugMode ? print : logger.d,
        ),
        InterceptorsWrapper(
          onRequest: (options, handler) {
            options.headers.addAll({
              if (token != null) 'x-device-token': token,
            });

            return handler.next(options);
          },
        ),
      ],
    );

  sl.registerLazySingleton<OAuthRepository>(() => OAuthRepository());

  final oauth = OAuth(
    tokenUrl: 'https://student.valuxapps.com/api/login',
    clientId: /*"2",*/
        sl<FirebaseRemoteConfig>().getString('clientId'),
    clientSecret: /*"st50khlD8l0oDBLv6iYzKpGp5ioIsJ7hEDvShuDL",*/
        sl<FirebaseRemoteConfig>().getString('clientSecret'),
    storage: sl<OAuthRepository>(),
    dio: dio,
  );

  dio.interceptors.add(BearerInterceptor(oauth));
  sl.registerFactory(() => UserBloc(loginRepository: sl<LoginRepository>()));

  sl.registerLazySingleton(() => oauth);
  sl.registerLazySingleton(() => dio);
}

void _initUtils() {
  time_ago.setDefaultLocale(Get.locale?.languageCode ?? 'en');
  time_ago.setLocaleMessages('en', time_ago.EnMessages());
  time_ago.setLocaleMessages('ar', time_ago.ArMessages());
}

// void _initNotifications() async {
//   sl.registerFactory(() => NotificationBloc());
//   final FirebaseMessaging fireBaseMessaging = FirebaseMessaging.instance;
//   final AndroidNotificationChannel androidNotificationChannel;
//   final FlutterLocalNotificationsPlugin localNotifications;
//
//   localNotifications = FlutterLocalNotificationsPlugin();
//   androidNotificationChannel = const AndroidNotificationChannel(
//     'default_notification_channel_id',
//     'default_notification_channel',
//     description: 'flutter_local_notifications_plugin',
//   );
//
//   // await localNotifications.initialize(
//   //   const InitializationSettings(
//   //     android: AndroidInitializationSettings(
//   //       'ic_stat_ic_notification',
//   //     ),
//   //     iOS: IOSInitializationSettings(),
//   //   ),
//   //   onSelectNotification: (notification) {
//   //     Get.to(
//   //         const NotificationsScreen()); },
//   // );
//
//   await fireBaseMessaging.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
//
//   await fireBaseMessaging.requestPermission(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
//
//   sl.registerLazySingleton(() => androidNotificationChannel);
//   sl.registerLazySingleton(() => localNotifications);
// }
