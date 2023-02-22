import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/hive/hive_chat_prompt_model.dart';
import 'core/hive/chat_prompt_model.dart';
import 'core/hive/hive_image_prompt_model.dart';
import 'core/services/dalle_prompt_service.dart';
import 'core/services/db_service.dart';
import 'mainstructure.dart';
import 'global/themes.dart';

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
        ChangeNotifierProvider(create: (context) => LocalDBService()),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dall-E 2',
          themeMode: ThemeMode.system,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: const MainStructure(),
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
