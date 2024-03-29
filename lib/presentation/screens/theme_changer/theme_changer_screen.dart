import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangeScreen extends ConsumerWidget {
  static const String name = 'theme_changer_screen';

  const ThemeChangeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkmode =
        ref.watch(themeNotifierProvider).isDarkmode; //detecta si hay un cambio

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: () {
              // ref.read(themeProvider.notifier).update((state) => !state);
              ref
                  .read(themeNotifierProvider.notifier)
                  .toggleDarkMode(); //notifica el cambio
            },
            icon: isDarkmode
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
          ),
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    //final selectedIndex = ref.watch(themeNotifierProvider).selectedColor;
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;
    

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];

        return RadioListTile(
          title: Text(
            'Este color',
            style: TextStyle(color: color),
          ),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: selectedColor, //watch
          onChanged: (value) {
            //todo: notifiar el cambio
            //read
            ref.watch(themeNotifierProvider.notifier).changColorIndex(index);
          },
        );
      },
    );
  }
}
