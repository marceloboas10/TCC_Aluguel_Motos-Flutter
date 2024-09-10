import 'package:aluguel_moto/shared/constantes/constants.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final PreferredSizeWidget? bottom;

  const MyAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.backgroundColor = kAppBarColor,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 24)),
      iconTheme: IconThemeData(color: Colors.white, size: 26),
      backgroundColor: backgroundColor,
      centerTitle: true,
      bottom: bottom,
    );
  }

  // Override the preferredSize to allow usage in Scaffold
  @override
  Size get preferredSize =>
      Size.fromHeight(bottom == null ? kToolbarHeight : kToolbarHeight + 50);
}
