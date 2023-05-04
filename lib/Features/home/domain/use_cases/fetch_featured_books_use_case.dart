import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failure.dart';

import '../../../../core/use_cases/use_case_without_params.dart';
import '../repos/home_repo.dart';

class FetchFeateredBooksUseCase implements UseCase<List<BookEntity>> {
  HomeRepo homeRepo;
  FetchFeateredBooksUseCase({
    required this.homeRepo,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
