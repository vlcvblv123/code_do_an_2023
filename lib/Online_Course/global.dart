import 'package:CodeGenius/Online_Course/common/routers/bloc_observer.dart';
import 'package:CodeGenius/Online_Course/common/services/storage_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../firebase_options.dart';

class Global{
  static late StorageService storageService;
  static Future init() async{
    WidgetsFlutterBinding.ensureInitialized();
    // Bloc.observer = MyGlobalObserver();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    storageService =  await StorageService().init();
  }
}