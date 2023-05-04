import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:hive_flutter/adapters.dart';

import '../models/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBook();
  Future<List<BookEntity>> fetchNewestBook();
}

class HomeReomteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeReomteDataSourceImpl({
    required this.apiService,
  });

  @override
  Future<List<BookEntity>> fetchFeaturedBook() async {
    var reposne = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&q=Programing");
    var parsedreposne = BookModelList.fromJson(reposne);
    saveToLocalDatabase(parsedreposne, kNewestBox);
    return getBookList(parsedreposne.items!);
  }

  @override
  Future<List<BookEntity>> fetchNewestBook() async {
    var reposne = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&Sorting=newest&q=Programing");
    var parsedreposne = BookModelList.fromJson(reposne);

    saveToLocalDatabase(parsedreposne, kNewestBox);

    return getBookList(parsedreposne.items!);
  }

  List<BookEntity> getBookList(List<BookModel> books) {
    List<BookModel> booksList = [];

    for (BookModel bookItem in books) {
      booksList.add(bookItem);
    }
    return booksList;
  }

  void saveToLocalDatabase(BookModelList parsedreposne, String boxName) {
    var box = Hive.box(boxName);
    box.addAll(getBookList(parsedreposne.items!));
  }
}
