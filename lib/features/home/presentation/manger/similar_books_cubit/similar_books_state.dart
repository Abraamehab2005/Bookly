part of 'similar_books_cubit.dart';


abstract class SimilarBooksState extends Equatable{
  const SimilarBooksState();
  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}
final class SimilarBooksLoading extends SimilarBooksState {}
final class SimilarBooksFailer extends SimilarBooksState {
  final String errMessage;
  const SimilarBooksFailer(this.errMessage);

}
final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;

 const SimilarBooksSuccess(this.books);
}

