/// Represents a single unit of work an application can perform.
abstract class UseCase <Type,Params> {
  /// Asynchronous method to be implemented in subclasses.
  Future<Type> call({Params params});
}