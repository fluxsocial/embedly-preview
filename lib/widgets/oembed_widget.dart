import 'package:embedly_preview/models/embedly_response_model.dart';
import 'package:embedly_preview/widgets/image_preview.dart';
import 'package:embedly_preview/widgets/rich_preview.dart';
import 'package:flutter/material.dart';

class OEmbedWidget extends StatefulWidget {
  const OEmbedWidget({
    Key key,
    @required this.data,
  }) : super(key: key);

  final OEmbedResponse data;

  @override
  _OEmbedWidgetState createState() => _OEmbedWidgetState();
}

class _OEmbedWidgetState extends State<OEmbedWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.data.type);
    switch (widget.data.type) {
      case OEmbedType.rich:
        return Card(
          child: RichPreview(data: widget.data,),
        );
      case OEmbedType.photo:
        return SizedBox(
          height: widget.data.height ?? 300,
          width: widget.data.width,
          child: Card(
            child: EmbdelyImagePreview(
              data: widget.data,
            ),
          ),
        );
      default:
        return SizedBox(
          height: widget.data.height ?? 300,
          width: widget.data.width,
          child: Card(
            child: EmbdelyImagePreview(
              data: widget.data,
            ),
          ),
        );
    }
  }
}