import 'package:CodeGenius/Online_Course/common/routers/names.dart';
import 'package:CodeGenius/Online_Course/common/values/constant.dart';
import 'package:CodeGenius/Online_Course/global.dart';
import 'package:CodeGenius/Online_Course/pages/application/bloc/app_events.dart';
import 'package:CodeGenius/Online_Course/pages/home/bloc/home_page_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/home/bloc/home_page_events.dart';
import 'package:CodeGenius/Online_Course/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/profile/settings/bloc/settings_states.dart';
import 'package:CodeGenius/Online_Course/pages/profile/settings/widgets/settings_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/base_text_widget.dart';
import '../../application/bloc/app_blocs.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBlocs>().add(const TriggerAppEvent(0));
    context.read<HomePageBlocs>().add(const HomePageDots(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("Settings"),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingsStates>(
            builder: (context, state) {
          return Column(
            children: [settingsButton(context, removeUserData)],
          );
        }),
      ),
    );
  }
}
