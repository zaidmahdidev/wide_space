import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/blocObserver.dart';
import 'core/network/local/cache_helper.dart';
import 'core/network/remote/dio_helper.dart';
import 'my_app.dart';
import 'injection_container.dart' as di;
import 'firebase_options.dart';


void main() async {

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
    );
    await CacheHelper.init();
    Bloc.observer = MyBlocObserver();
    DioHelper.init();
    await di.initialize();
    // CacheHelper.saveData(key: 'isDark' , value: false);
    runApp(MyApp());

  }