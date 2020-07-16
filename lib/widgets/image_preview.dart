import 'package:embedly_preview/const.dart';
import 'package:embedly_preview/models/embedly_response_model.dart';
import 'package:embedly_preview/widgets/card_section.dart';
import 'package:flutter/material.dart';

class EmbdelyImagePreview extends StatelessWidget {
  const EmbdelyImagePreview({Key key, @required this.data}) : super(key: key);

  final OEmbedResponse data;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (data.thumbnailUrl != null)
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.center,
              child: Image.network(
                data.thumbnailUrl,

                fit: BoxFit.contain,
              ),
            ),
          ),
        if (data.description != null)
          Expanded(
            flex: 2,
            child: EmbedlyCardSection(
              title: Strings.sharedBy,
              info: data.description,
            ),
          ),
        if (data.authorName != null)
          Expanded(
            child: EmbedlyCardSection(
              title: Strings.description,
              info: data.authorName,
              vertical: false,
            ),
          ),
      ],
    );
  }
}
