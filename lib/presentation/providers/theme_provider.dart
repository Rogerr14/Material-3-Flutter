import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final themeProvider = StateProvider((ref) => false);

//Lsitado de colores inmutables

final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

//controller o notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  //STATE = new AppTheme()
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }

  void changColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
