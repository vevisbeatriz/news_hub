import 'package:dio/dio.dart';

/// `DataState` is an abstract class that represents the state of a data fetch operation.
/// It has two properties: `data` of generic type `T`, and `error` of type `DioException`.
/// The `data` property is used to hold the data if the fetch operation is successful,
/// and the `error` property is used to hold the error if the fetch operation fails.
/// The `DataState` class is initialized with named parameters.
abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState({this.data, this.error});
}

/// `DataSuccess` is a subclass of `DataState` and represents a successful data fetch operation.
/// It takes a single parameter of generic type `T` which represents the data fetched.
/// This data is passed to the super class constructor to initialize the `data` property.
class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

/// `DataFailed` is another subclass of `DataState` and represents a failed data fetch operation.
/// It takes a single parameter of type `DioException` which represents the error occurred during the fetch operation.
/// This error is passed to the super class constructor to initialize the `error` property.
class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}
