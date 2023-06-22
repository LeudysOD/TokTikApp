import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_app/config/theme/app_theme.dart';
import 'package:tiktok_app/presentation/provider/discover_provider.dart';
import 'package:tiktok_app/presentation/screens/discover/discover_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( 
        create: (_) => DiscoverProvider()..loadNextPage())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tik Tok',
        theme: AppTheme(selectedColor: 0,brightnessTheme: Brightness.dark).theme(),
        home: DiscoverScreen(),
      ),
    );
  }
}
