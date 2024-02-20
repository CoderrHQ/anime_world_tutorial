import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  const ReadMoreText({
    super.key,
    required this.longText,
  });

  final String longText;

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool readMore = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          widget.longText,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).primaryColor,
          ),
          maxLines: readMore ? 1000 : 5,
          overflow: TextOverflow.ellipsis,
        ),
        TextButton(
          onPressed: () {
            setState(() {
              readMore = !readMore;
            });
          },
          child: Text(readMore ? 'Read less' : 'Read more'),
        ),
      ],
    );
  }
}
