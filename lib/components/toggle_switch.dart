import 'package:flutter/cupertino.dart';
import 'package:habit_tracker/themes/themeprovider.dart';
import 'package:provider/provider.dart';

class Toggle extends StatelessWidget {
  const Toggle({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: Provider.of<ThemeProvider>(context).isDarkMode,
      onChanged: (value) =>
          Provider.of<ThemeProvider>(context, listen: false).changeTheme(),
    );
  }
}
