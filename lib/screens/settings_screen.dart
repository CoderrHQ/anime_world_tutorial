import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/common/styles/paddings.dart';
import '/cubits/anime_title_language_cubit.dart';
import '/cubits/theme_cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Padding(
        padding: Paddings.defaultPadding,
        child: Column(
          children: [
            // Dark mode switch
            AppThemeSwitch(),

            SizedBox(height: 10),

            // Anime Title name switch
            AnimeTitleLanguageSwitch(),
          ],
        ),
      ),
    );
  }
}

//! Dark Mode Switch
class AppThemeSwitch extends StatefulWidget {
  const AppThemeSwitch({super.key});

  @override
  State<AppThemeSwitch> createState() => AppThemeSwitchState();
}

class AppThemeSwitchState extends State<AppThemeSwitch> {
  bool isDarkMode = false;

  Future<void> toggleTheme(value) async {
    setState(() => isDarkMode = !isDarkMode);
    await context.read<ThemeCubit>().changeTheme(
          isDarkMode: isDarkMode,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Dark Theme'),
        BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, state) {
            isDarkMode = state == ThemeMode.dark;
            return CupertinoSwitch(
              value: isDarkMode,
              onChanged: toggleTheme,
            );
          },
        ),
      ],
    );
  }
}

//! Anime Title Language Switch
class AnimeTitleLanguageSwitch extends StatefulWidget {
  const AnimeTitleLanguageSwitch({super.key});

  @override
  State<AnimeTitleLanguageSwitch> createState() =>
      AnimeTitleLanguageSwitchState();
}

class AnimeTitleLanguageSwitchState extends State<AnimeTitleLanguageSwitch> {
  bool isEnglish = false;

  Future toggleAnimeTitleLanguage(bool value) async {
    setState(() => isEnglish = value);
    await context
        .read<AnimeTitleLanguageCubit>()
        .changeAnimeTitleLanguage(isEnglish: isEnglish);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Use English Names'),
        BlocBuilder<AnimeTitleLanguageCubit, IsEnglish>(
          builder: (context, state) {
            isEnglish = state;

            return CupertinoSwitch(
              value: isEnglish,
              onChanged: toggleAnimeTitleLanguage,
            );
          },
        ),
      ],
    );
  }
}
