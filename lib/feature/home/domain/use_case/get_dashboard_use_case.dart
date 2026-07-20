import 'package:dartz/dartz.dart';
import 'package:interview_pilot/core/error/Failure.dart';
import 'package:interview_pilot/core/helpers/base_use_case.dart';
import 'package:interview_pilot/feature/home/domain/entities/dashboard_entity.dart';
import 'package:interview_pilot/feature/home/domain/home_repository.dart';

class GetDashboardUseCase extends UseCase<DashboardEntity, NoParams> {
  final HomeRepository homeRepository;

  GetDashboardUseCase(this.homeRepository);

  @override
  Future<Either<Failure, DashboardEntity>> call(NoParams params) async {
    return await homeRepository.getDashboard();
  }
}
