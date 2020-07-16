
import 'package:flutter/material.dart';

class EmbedlyCardSection extends StatelessWidget {
  const EmbedlyCardSection({
    Key key,
    @required this.title,
    @required this.info,
    this.vertical = true,
  }) : super(key: key);

  final bool vertical;
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    if (vertical) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4.0),
            Flexible(
              child: Text(info),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4.0),
            Text(info),
          ],
        ),
      );
    }
  }
}
