import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'book_entity.g.dart';



@HiveType(typeId: 0)
class BookEntity extends  HiveObject  {
  @HiveField(0)
  final String authorName;
   @HiveField(1)
  final String bookId;
   @HiveField(2)
  final String bookImage;
   @HiveField(3)
  final num rating;
   @HiveField(4)
  final num price;

  BookEntity({
    required this.bookId,
    required this.authorName,
    required this.bookImage,
    required this.price,
    required this.rating,
  });

  @override
  List<Object?> get props => [
        bookId,
        authorName,
        bookImage,
        rating,
        price,
      ];
}
