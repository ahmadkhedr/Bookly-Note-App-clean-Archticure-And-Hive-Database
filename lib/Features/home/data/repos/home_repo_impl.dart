import 'package:bookly/Features/home/data/data_sources/home_local_datasource.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_datasource.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failure.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeLocalDataSource homeLocalDataSource;
  HomeRepoImpl({
    required this.homeLocalDataSource,
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var bookList = homeLocalDataSource.fetchFeaturedBook();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      var books = await homeRemoteDataSource.fetchFeaturedBook();
      return right(books);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var bookList = homeLocalDataSource.fetchNewestBook();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      var books = await homeRemoteDataSource.fetchNewestBook();
      return right(books);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
