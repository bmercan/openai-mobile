import 'package:flutter/material.dart';
import 'package:mobile_gpt/core/services/chatgpt_prompt_service.dart';
import 'package:mobile_gpt/features/landing/view/landingview.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/hive/hive_chat_prompt_model.dart';
import 'core/hive/chat_prompt_model.dart';
import 'core/hive/hive_image_prompt_model.dart';
import 'core/services/dalle_prompt_service.dart';
import 'core/services/db_service.dart';
import 'global/themes.dart';
import 'mainstructure.dart';

void main() async {
  await Hive.initFlutter();
  await openBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DallEPromptService()),
        ChangeNotifierProvider(create: (context) => ChatGPTPromptService()),
        ChangeNotifierProvider(create: (context) => LocalDBService()),
      ],
      builder: (context, child) {
        return MaterialApp(
          routes: {
            '/': (context) => const LandingView(),
            '/mainStructure': (context) => const MainStructure(),
          },
          debugShowCheckedModeBanner: false,
          title: 'Mobile-GPT',
          themeMode: ThemeMode.light,
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
        );
      },
    );
  }
}

Future<void> openBox() async {
  Hive.registerAdapter(HiveChatPromptModelAdapter());
  Hive.registerAdapter(ChatPromptModelAdapter());
  Hive.registerAdapter(HiveImagePromptModelAdapter());
  await Hive.openBox<HiveImagePromptModel>('imageBox');
  await Hive.openBox<HiveChatPromptModel>('chatBox');
}
