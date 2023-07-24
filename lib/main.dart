import 'package:CodeGenius/Chatgpt/screens/chatgpt_screen.dart';
import 'package:CodeGenius/Online_Course/common/routers/routes.dart';
import 'package:CodeGenius/Online_Course/common/values/colors.dart';
import 'package:CodeGenius/Online_Course/global.dart';
import 'package:CodeGenius/Online_Course/pages/application/application_page.dart';
import 'package:CodeGenius/Online_Course/pages/profile/settings/setting_page.dart';
import 'package:CodeGenius/Online_Course/pages/sign_in/sign_in.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Online_Course/pages/register/register.dart';

// import 'Chatgpt/screens/chatgpt_screen.dart';
// void main() {
//   runApp(const ChatgptScreen());
// }
Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProvider(context)],
      child: ScreenUtilInit(
        designSize: const Size(375,812),
          builder: (context, child) => MaterialApp(
              builder: EasyLoading.init(),
                theme: ThemeData(
                    appBarTheme: const AppBarTheme(
                        iconTheme: IconThemeData(color: AppColors.primaryText),
                        elevation: 0,
                        backgroundColor: Colors.white),
                    fontFamily: 'Poppins'),
                debugShowCheckedModeBanner: false,
                onGenerateRoute: AppPages.GenerateRouteSettings,
                routes: {
                  // "myHomePage": (context) => const MyHomePage(),
                  "signIn": (context) => const SignIn(),
                  "chatGptScreen": (context) => const ChatGPTScreen(),
                  "register": ((context) => const Register()),
                  "application":((context) => const ApplicationPage()),
                  "settings": (context) => const SettingsPage()

                },
              )),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Flutter Demo"),
//         ),
//         body: Center(
//             child: BlocBuilder<AppBlocs, AppState >(builder: (context, state) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text(
//                 'You have pushed the button this many times:',
//               ),
//               Text(
//                 "${BlocProvider.of<AppBlocs>(context).state.counter}",
//                 style: Theme.of(context).textTheme.headlineMedium,
//               ),
//             ],
//           );
//         })),
//         floatingActionButton: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             FloatingActionButton(
//               heroTag: "heroTag1",
//               onPressed: () =>
//                   BlocProvider.of<AppBlocs>(context).add(Decrement()),
//               tooltip: 'Decrement',
//               child: const Icon(Icons.remove),
//             ),
//             FloatingActionButton(
//               heroTag: "heroTag2",
//               onPressed: () =>
//                   BlocProvider.of<AppBlocs>(context).add(Increment()),
//               tooltip: 'Increment',
//               child: const Icon(Icons.add),
//             ),
//           ],
//         )
//         // This trailing comma makes auto-formatting nicer for build methods.
//         );
//   }
// }
