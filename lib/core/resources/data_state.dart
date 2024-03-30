import 'package:dio/dio.dart';

/// `DataState` is an abstract class that represents the state of a data fetch operation.
/// The `data` property is used to hold the data if the fetch operation is successful,
/// and the `error` property is used to hold the error if the fetch operation fails.
abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState({this.data, this.error});
}

/// `DataSuccess` is a subclass of `DataState` and represents a successful data fetch operation.
class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

/// `DataFailed` is another subclass of `DataState` and represents a failed data fetch operation.
class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}
