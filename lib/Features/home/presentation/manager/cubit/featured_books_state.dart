part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksSuceess extends FeaturedBooksState {
  final List<BookEntity> booksList;

  const FeaturedBooksSuceess(
    this.booksList,
  );
}

class FeaturedBooksFailure extends FeaturedBooksState {
  final String errorMesgae;

  const FeaturedBooksFailure(
    this.errorMesgae,
  );
}
