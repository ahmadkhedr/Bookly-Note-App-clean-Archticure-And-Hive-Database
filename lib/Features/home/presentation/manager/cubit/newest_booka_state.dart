part of 'newest_booka_cubit.dart';

abstract class NewestBookaState extends Equatable {
  const NewestBookaState();

  @override
  List<Object> get props => [];
}

class NewestBookaInitial extends NewestBookaState {}

class NewestBookaLoading extends NewestBookaState {}

class NewestBookaSucess extends NewestBookaState {
  final List<BookEntity> booksList;

  const NewestBookaSucess(
    this.booksList,
  );
}

class NewestBookaFail extends NewestBookaState {
  final String errorMessage;

  const NewestBookaFail(
    this.errorMessage,
  );
}
