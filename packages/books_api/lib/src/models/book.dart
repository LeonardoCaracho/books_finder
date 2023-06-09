import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book {
  Book({
    required this.id,
    required this.saleInfo,
    required this.volumeInfo,
  });

  final String id;
  final VolumeInfo volumeInfo;
  final SaleInfo? saleInfo;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}

@JsonSerializable()
class VolumeInfo {
  VolumeInfo({
    this.title,
    this.authors,
    this.categories,
    this.description,
    this.imageLinks,
    this.pageCount,
    this.publishedDate,
    this.publisher,
  });

  final String? title;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final int? pageCount;
  final List<String>? categories;
  final ImageLinks? imageLinks;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => _$VolumeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$VolumeInfoToJson(this);
}

@JsonSerializable()
class ImageLinks {
  ImageLinks({
    this.thumbnail,
  });

  final String? thumbnail;

  factory ImageLinks.fromJson(Map<String, dynamic> json) => _$ImageLinksFromJson(json);
  Map<String, dynamic> toJson() => _$ImageLinksToJson(this);
}

@JsonSerializable()
class SaleInfo {
  SaleInfo({
    this.buyLink,
  });

  final String? buyLink;

  factory SaleInfo.fromJson(Map<String, dynamic> json) => _$SaleInfoFromJson(json);
  Map<String, dynamic> toJson() => _$SaleInfoToJson(this);
}
