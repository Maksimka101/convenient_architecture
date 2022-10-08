import 'package:convenient_architecture/convenient_architecture.dart';
import 'package:dio/dio.dart';
import 'package:example/domain/core/failure.dart';

final _dioApiResponseParser = ResponseParser<Response<Json?>, Failure>(
  dataExtractor: (response) => response.data?['data'],
  failureParser: (response) => Failure(response.data?['error']?['message']),
  errorCatcher: (error, stackTrace) => Failure(error.toString()),
);

Future<Either<Failure, Data>> parseApiResponse<Data>({
  required RequestAction<Response<Json?>> requestAction,
  required Mapper<Data, Json> mapper,
}) {
  return _dioApiResponseParser.parseApiResponse(
    requestAction: requestAction,
    mapper: mapper,
  );
}

Future<Either<Failure, List<Data>>> parseListApiResponse<Data>({
  required RequestAction<Response<Json?>> requestAction,
  required Mapper<Data, Json> mapper,
}) {
  return _dioApiResponseParser.parseListApiResponse(
    requestAction: requestAction,
    mapper: mapper,
  );
}

Future<Option<Failure>> parseEmptyApiResponse({
  required RequestAction<Response<Json?>> requestAction,
}) {
  return _dioApiResponseParser.parseEmptyApiResponse(
    requestAction: requestAction,
  );
}
