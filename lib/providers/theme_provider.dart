import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier{
  bool isDarkMode = false;

  void toggleTheme(){
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}