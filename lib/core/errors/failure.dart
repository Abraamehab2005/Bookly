import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Conneection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure("BadCertificate timeout with ApiServer");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure("Request to ApiServer was canceled");

      case DioExceptionType.unknown:
        if (dioError.message?.contains('SocketException') ?? false) {
          return ServerFailure("No Internet Connection");
        }
        return ServerFailure(
          dioError.message ?? 'Unexpected Error',
        );
      case DioExceptionType.connectionError:
      return ServerFailure('No Internet Connection');
      case DioExceptionType.transformTimeout:
      return ServerFailure('Data processing timeout');
      default:
       return ServerFailure("Opps There was an Error, Please try later!");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found, Please try later!");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server errors, Please try later!");
    } else {
      return ServerFailure("Opps There was an Error, Please try later!");
    }
  }
}
