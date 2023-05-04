import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/use_case_without_params.dart';
import 'package:dartz/dartz.dart';

class FetchNewesetBooksUSeCase implements UseCase<List<BookEntity>> {
  HomeRepo homeRepo;
  FetchNewesetBooksUSeCase({
    required this.homeRepo,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await homeRepo.fetchNewestBooks();
  }
}
