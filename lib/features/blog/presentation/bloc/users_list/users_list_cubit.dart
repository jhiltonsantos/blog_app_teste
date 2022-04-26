import 'package:blog_teste_tecnico/features/blog/data/repositories/user_repository.dart';
import 'package:blog_teste_tecnico/features/blog/presentation/bloc/users_list/users_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListCubit extends Cubit<UsersListState> {
  UsersListCubit() : super(const InitUsersListState());

  void reloadList(UserRepository user) async {
    emit(const LoadingUsersListState());
    user.findAllUser().then((users) => emit(LoadedUsersListState(users)));
  }

}