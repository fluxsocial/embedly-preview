import 'package:embedly_preview/embedly_preview.dart';
import 'package:flutter/material.dart';
import 'package:embedly_preview/theme/theme.dart';

class EmbdelyLinkPreview extends StatelessWidget {
  const EmbdelyLinkPreview({
    Key key,
    @required this.data,
  }) : super(key: key);

  final OEmbedResponse data;

  @override
  Widget build(BuildContext context) {
    final theme = EmbedlyThemeProvider.of(context);
    return Card(
      color: theme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (data.thumbnailUrl != null)
              Align(
                alignment: Alignment.center,
                child: Image.network(
                  data.thumbnailUrl,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 12.0),
            if (data.title != null)
              Text(
                data.title,
                style: theme.headingText,
              ),
            const SizedBox(height: 8.0),
            if (data.description != null)
              Text(
                data.description,
                style: theme.subheadingText,
              )
          ],
        ),
      ),
    );
  }
}
