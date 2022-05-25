import 'package:flutter/material.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.brightness_6),
      // splashColor: Colors.transparent,
      onPressed: () {
        EasyDynamicTheme.of(context).changeTheme();
      },
    );
  }
}
