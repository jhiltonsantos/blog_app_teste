import 'package:blog_teste_tecnico/core/error/failures.dart';
import 'package:blog_teste_tecnico/core/usecases/usecase.dart';
import 'package:blog_teste_tecnico/features/blog/data/repositories/photo_repository.dart';
import 'package:blog_teste_tecnico/features/blog/domain/usecases/photos/find_all_photos.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/dashboard/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  final FindAllPhotos _allPhotos;

  DashboardCubit(this._allPhotos) : super(const InitDashboardState());

  Future<void> findAllPhotos(PhotoRepository photo) async {
    emit(const LoadingDashboardState());
    //final response = await _allPhotos(NoParams());
    //response.then((photos) => emit(LoadedDashboardState(photos)));
    _allPhotos(NoParams()).then((photos) => emit(LoadedDashboardState(photos)));
  }
}
