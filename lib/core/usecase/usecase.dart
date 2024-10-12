import 'package:fpdart/fpdart.dart';
import 'package:url_shortner/core/error/failure.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call({required Params params});
}
