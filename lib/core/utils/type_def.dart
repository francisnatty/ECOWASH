import 'package:dartz/dartz.dart';
import 'package:ecowash/core/api/api.dart';

typedef ApiResult<T> = Future<Either<Failure, T>>;
