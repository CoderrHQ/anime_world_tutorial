import 'package:flutter/material.dart';

class IosBackButton extends StatelessWidget {
  const IosBackButton({
    Key? key,
    required this.onPressed,
    this.borderWidth = 2.0,
  }) : super(key: key);

  final VoidCallback onPressed;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          width: 35,
          height: 35,
          child: Container(
            color: Theme.of(context).shadowColor,
            alignment: Alignment.center,
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
