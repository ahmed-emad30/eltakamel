import 'package:eltakamel/core/helpers/shared_preference/preference_helper.dart';
import 'package:eltakamel/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app/eltakamel_app.dart';
import 'core/helpers/observers/bloc_observer.dart';

void main() async{
     Bloc.observer  = MyBlocObserver();
      WidgetsFlutterBinding.ensureInitialized();
     await PrefHelper.init();
     await ServiceLocator.init();

  runApp(const EltakamelApp());
}



