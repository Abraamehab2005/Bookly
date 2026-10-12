part of 'newest_cubit.dart';



abstract class NewestState extends Equatable{
  const NewestState();
  @override
  List<Object> get props => [];
}

final class NewestInitial extends NewestState {}
final class NewestLoading extends NewestState {}
final class NewestFailure  extends NewestState {
  final String errorMessage;

 const NewestFailure(this.errorMessage);
}
final class NewestSuccess extends NewestState {
  final List<BookModel> books;

 const NewestSuccess(this.books);
}
