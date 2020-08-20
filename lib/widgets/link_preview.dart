import 'package:embedly_preview/embedly_preview.dart';
import 'package:flutter/material.dart';
import 'package:embedly_preview/theme/theme.dart';

class EmbedlyLinkPreview extends StatelessWidget {
  const EmbedlyLinkPreview({
    Key key,
    @required this.data,
    @required this.preview,
  }) : super(key: key);

  final OEmbedResponse data;
  final bool preview;

  @override
  Widget build(BuildContext context) {
    final theme = EmbedlyThemeProvider.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: .5,
        ),
        borderRadius: BorderRadius.circular(9),
      ),
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
          if (data.title != null || data.title.isNotEmpty)
            Text(
              data.title,
              style: theme.headingText,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          const SizedBox(height: 8.0),
          if (data.description != null || data.title.isNotEmpty)
            Text(
              data.description,
              style: theme.subheadingText,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )
        ],
      ),
    );
  }
}
