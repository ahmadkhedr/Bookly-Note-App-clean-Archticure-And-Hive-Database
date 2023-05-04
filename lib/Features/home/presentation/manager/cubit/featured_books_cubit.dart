import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_cases/fetch_featured_books_use_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit({required this.fetchFeateredBooksUseCase})
      : super(FeaturedBooksInitial());
  FetchFeateredBooksUseCase fetchFeateredBooksUseCase;

  getFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var response = await fetchFeateredBooksUseCase.call();
    response.fold((l) {
      emit(FeaturedBooksFailure(l.message));
    }, (r) {
      emit(FeaturedBooksSuceess(r));
    });
  }
}
