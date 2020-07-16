import 'package:embedly_preview/models/embedly_response_model.dart';
import 'package:flutter/material.dart';

//TODO(Nash): Find an optimal way to display rich content in the application.
class RichPreview extends StatelessWidget {
  const RichPreview({Key key, @required this.data}) : super(key: key);

  final OEmbedResponse data;
  @override
  Widget build(BuildContext context) {
    if (data.thumbnailUrl == null && data.html != null) {
      return SizedBox();
    }
    return SizedBox();
  }
}
