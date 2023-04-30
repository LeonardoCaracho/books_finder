import 'package:books_api/books_api.dart' as api;
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book extends Equatable {
  Book({
    required this.id,
    this.title = "",
    this.authors = const [],
    this.categories = const [],
    this.description = "",
    this.pageCount = 0,
    this.publishedDate = "",
    this.publisher = "",
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
        buyLink: book.saleInfo?.buyLink,
      );

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);

  @override
  List<Object?> get props => [
        id,
        thumbnail,
        title,
        authors,
        categories,
        description,
        pageCount,
        publishedDate,
        publisher,
        buyLink,
      ];
}
