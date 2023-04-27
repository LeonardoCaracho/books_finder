import 'package:books_api/books_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'books_response.g.dart';

@JsonSerializable()
class BooksResponse {
  BooksResponse(this.items);

  final List<Book> items;

  factory BooksResponse.fromJson(Map<String, dynamic> json) => _$BooksResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BooksResponseToJson(this);
}
