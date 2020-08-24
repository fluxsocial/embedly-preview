import 'package:embedly_preview/embedly_preview.dart';
import 'package:flutter/material.dart';
import 'package:embedly_preview/theme/theme.dart';

class EmbedlyLinkOpen extends StatelessWidget {
  const EmbedlyLinkOpen({
    Key key,
    @required this.data,
  }) : super(key: key);

  final OEmbedResponse data;

  @override
  Widget build(BuildContext context) {
    final theme = EmbedlyThemeProvider.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: .75,
        ),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (data.thumbnailUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: .75,
                  ),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Image.network(
                  data.thumbnailUrl,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * .14,
                  width: MediaQuery.of(context).size.height * .14,
                ),
              ),
            ),
          data.title.isEmpty && data.description.isEmpty
              ? const SizedBox()
              : Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (data.title.isNotEmpty || data.title != '')
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              data.title,
                              style: theme.headingText,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        if (data.description.isNotEmpty)
                          Text(
                            data.description,
                            style: theme.subheadingText,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
