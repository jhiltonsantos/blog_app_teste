import 'package:blog_teste_tecnico/data/repositories/photo_repository.dart';
import 'package:blog_teste_tecnico/presentation/bloc/dashboard/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const InitDashboardState());

  void reloadList(PhotoRepository photo) async {
    emit(const LoadingDashboardState());
    photo.findAllPhotos().then((photos) => emit(LoadedDashboardState(photos)));
  }

}