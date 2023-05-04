import 'package:bookly/constants.dart';
import 'package:hive_flutter/adapters.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBook();
  List<BookEntity> fetchNewestBook();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchNewestBook() {
    return retriveDataFromDatabase(kNewestBox);
  }

  @override
  List<BookEntity> fetchFeaturedBook() {
    return retriveDataFromDatabase(kFeaturedBox);
  }

  List<BookEntity> retriveDataFromDatabase(String boxName) {
    var box = Hive.box<BookEntity>(boxName);
    return box.values.toList();
  }
}
