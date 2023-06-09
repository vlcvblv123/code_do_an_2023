
import 'package:CodeGenius/Online_Course/pages/register/bloc/register_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/sign_in/bloc/signin_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/bloc/app_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => AppBlocs(),
        ),
        BlocProvider(
          // lazy: false,
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          // lazy: false,
          create: (context) => RegisterBlocs(),
        ),
      ];
}
