import 'package:books_api/books_api.dart' as api;
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book {
  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.categories,
    required this.description,
    required this.pageCount,
    required this.publishedDate,
    required this.publisher,
    this.thumbnail,
    this.buyLink,
  });

  final String id;
  final String title;
  final List<String> authors;
  final String publisher;
  final String publishedDate;
  final String description;
  final int pageCount;
  final List<String> categories;
  final String? thumbnail;
  final String? buyLink;

  factory Book.fromApi(api.Book book) => Book(
        id: book.id,
        thumbnail: book.volumeInfo.imageLinks?.thumbnail,
        title: book.volumeInfo.title ?? "",
        authors: book.volumeInfo.authors ?? [],
        categories: book.volumeInfo.categories ?? [],
        description: book.volumeInfo.description ?? "",
        pageCount: book.volumeInfo.pageCount ?? 0,
        publishedDate: book.volumeInfo.publishedDate ?? "",
        publisher: book.volumeInfo.publisher ?? "",
        buyLink: book.salesInfo?.buyLink,
      );

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}
