import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/use_cases/fetch_neweset_books_usecase.dart';

part 'newest_booka_state.dart';

class NewestBookaCubit extends Cubit<NewestBookaState> {
  NewestBookaCubit({
    required this.fetchNewesetBooksUSeCase,
  }) : super(NewestBookaInitial());
  FetchNewesetBooksUSeCase fetchNewesetBooksUSeCase;

  getNewestBooks() async {
    emit(NewestBookaLoading());
    var response = await fetchNewesetBooksUSeCase.call();

    response.fold((l) {
      emit(
        NewestBookaFail(l.message),
      );
    }, (r) {
      emit(NewestBookaSucess(r));
    });
  }
}
