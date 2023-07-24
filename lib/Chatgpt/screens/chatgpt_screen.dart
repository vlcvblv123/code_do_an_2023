import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/color.dart';
import '../providers/chat_provider.dart';
import '../providers/models_provider.dart';
import 'chat_screen.dart';

class ChatGPTScreen extends StatelessWidget {
  const ChatGPTScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Chat Gpt',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Poppins',
            scaffoldBackgroundColor: scfbgc,
            appBarTheme: AppBarTheme(
              color: kcardColor,
            )),
        home: const ChatScreen(),
      ),
    );
  }
}
