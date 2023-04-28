// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      id: json['id'] as String,
      thumbnail: json['thumbnail'] as String,
      title: json['title'] as String,
      authors:
          (json['authors'] as List<dynamic>).map((e) => e as String).toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String,
      pageCount: json['pageCount'] as int,
      publishedDate: json['publishedDate'] as String,
      publisher: json['publisher'] as String,
      buyLink: json['buyLink'] as String?,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'publishedDate': instance.publishedDate,
      'description': instance.description,
      'pageCount': instance.pageCount,
      'categories': instance.categories,
      'thumbnail': instance.thumbnail,
      'buyLink': instance.buyLink,
    };
