import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management_task/providers/theme_provider.dart';
import 'package:provider_state_management_task/screens/catalog_screen.dart';
import 'providers/cart_provider.dart';
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>CartProvider()),
      ChangeNotifierProvider(create: (context)=>ThemeProvider()),
    ]
  ,child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          home: const CatalogScreen(),
        );
      },
    );
  }
}
