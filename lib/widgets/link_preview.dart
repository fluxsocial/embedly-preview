import 'package:embedly_preview/embedly_preview.dart';
import 'package:flutter/material.dart';
import 'package:embedly_preview/theme/theme.dart';

class EmbedlyLinkPreview extends StatelessWidget {
  const EmbedlyLinkPreview({
    Key? key,
    required this.data,
  }) : super(key: key);

  final OEmbedResponse data;

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
            ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.network(
                data.thumbnailUrl!,
                fit: BoxFit.cover,
              ),
            ),
          if (data.description != null)
            if (data.description!.isEmpty)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (data.description!.isNotEmpty)
                      Text(
                        data.description!,
                        style: theme!.subheadingText,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              )
            else
              SizedBox()
          else
            SizedBox(),
        ],
      ),
    );
  }
}
