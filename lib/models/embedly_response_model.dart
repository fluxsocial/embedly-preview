import 'package:meta/meta.dart';

enum OEmbedType { video, link, photo, rich, unsupported }

/// Parses the response sent back from the Embedly API.
/// The fields `type` and `version` must be supplied.
class OEmbedResponse {
  OEmbedResponse({
    required this.type,
    required this.version,
    this.title,
    this.description,
    this.authorName,
    this.authorUrl,
    this.providerName,
    this.cacheAge,
    this.thumbnailUrl,
    this.thumbnailHeight,
    this.thumbnailWidth,
    this.html,
    this.width,
    this.height,
  });

  factory OEmbedResponse.fromMap(Map<String, dynamic> map) {
    return new OEmbedResponse(
      type: parseType(map['type']),
      version: double.parse(map['version']),
      title: map['title'],
      description: map['description'],
      authorName: map['author_name'],
      authorUrl: map['author_url'],
      providerName: map['provider_name'],
      cacheAge: map['cache_age'],
      thumbnailUrl: map['thumbnail_url'],
      thumbnailWidth: map['thumbnail_width']?.toDouble(),
      thumbnailHeight: map['thumbnail_height']?.toDouble(),
      width: map['width']?.toDouble(),
      height: map['height']?.toDouble(),
      html: map['html'],
    );
  }

  final OEmbedType type;
  final double version;
  // Optional
  final String? title;
  final String? description;
  final String? authorName;
  final String? authorUrl;
  final String? providerName;
  final String? thumbnailUrl;
  final double? thumbnailWidth;
  final double? thumbnailHeight;
  final double? width;
  final double? height;
  final String? html;

  // In milliseconds
  final int? cacheAge;

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'version': version,
      'title': title,
      'description': description,
      'author_name': authorName,
      'author_url': authorUrl,
      'provider_name': providerName,
      'cache_age': cacheAge,
      'thumbnail_url': thumbnailUrl,
      'thumbnail_width': thumbnailWidth,
      'thumbnail_height': thumbnailHeight,
      'width': width,
      'height': height,
      'html': html,
    };
  }

  static OEmbedType parseType(String? type) {
    switch (type) {
      case "video":
        return OEmbedType.video;
      case "photo":
        return OEmbedType.photo;
      case "link":
        return OEmbedType.link;
      case "rich":
        return OEmbedType.rich;
      default:
        return OEmbedType.unsupported;
    }
  }
}
