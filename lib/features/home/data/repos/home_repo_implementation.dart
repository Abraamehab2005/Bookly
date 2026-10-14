import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpelmetion implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpelmetion(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endpoint:
            "volumes?q=subject:medicien&key=AIzaSyB7xk8hInpLMVGEVTOuHMjfg0FfYm-2D9U&Filtering=free-ebooks&Sorting=newest",
      );
      List<BookModel> books = [];
      final items = data['items'] as List<dynamic>? ?? [];
      for (var item in items) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endpoint:
            "volumes?q=subject:medicien&key=AIzaSyB7xk8hInpLMVGEVTOuHMjfg0FfYm-2D9U&Filtering=free-ebooks",
      );
      List<BookModel> books = [];
      //adding
      final items = data['items'] as List<dynamic>? ?? [];
      for (var item in items) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
