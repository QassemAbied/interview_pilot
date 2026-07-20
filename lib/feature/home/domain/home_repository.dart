import 'package:dartz/dartz.dart';

import '../../../core/error/Failure.dart';
import 'entities/dashboard_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, DashboardEntity>> getDashboard();
}