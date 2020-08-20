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
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: Image.network(
                data.thumbnailUrl,
                fit: BoxFit.cover,
              ),
            ),
          if (data.title != null || data.title.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Text(
                data.title,
                style: theme.headingText,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
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
