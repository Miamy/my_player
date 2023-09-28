import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final Icon icon;

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero))),
        fixedSize: MaterialStateProperty.all(const Size.square(22)),
      ),
      onPressed: () => onPressed,
      child: icon,
    );
  }
}
