// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/blog/data/repositories/photo_repository.dart' as _i3;
import '../../features/blog/data/repositories/post_repository.dart' as _i4;
import '../../features/blog/data/repositories/user_repository.dart' as _i11;
import '../../features/blog/domain/entities/photo.dart' as _i6;
import '../../features/blog/domain/entities/post.dart' as _i8;
import '../../features/blog/domain/entities/user.dart' as _i23;
import '../../features/blog/domain/usecases/photos/delete_photo.dart' as _i12;
import '../../features/blog/domain/usecases/photos/find_all_photos.dart'
    as _i15;
import '../../features/blog/domain/usecases/photos/find_by_id_photo.dart'
    as _i19;
import '../../features/blog/domain/usecases/photos/save_photo.dart' as _i5;
import '../../features/blog/domain/usecases/photos/update_photo.dart' as _i9;
import '../../features/blog/domain/usecases/posts/delete_post.dart' as _i13;
import '../../features/blog/domain/usecases/posts/find_all_posts.dart' as _i16;
import '../../features/blog/domain/usecases/posts/find_all_posts_by_user.dart'
    as _i17;
import '../../features/blog/domain/usecases/posts/find_by_id_post.dart' as _i20;
import '../../features/blog/domain/usecases/posts/save_post.dart' as _i7;
import '../../features/blog/domain/usecases/posts/update_post.dart' as _i10;
import '../../features/blog/domain/usecases/users/delete_user.dart' as _i14;
import '../../features/blog/domain/usecases/users/find_all_users.dart' as _i18;
import '../../features/blog/domain/usecases/users/find_by_id_user.dart' as _i21;
import '../../features/blog/domain/usecases/users/save_user.dart' as _i22;
import '../../features/blog/domain/usecases/users/update_user.dart' as _i24;
import '../../features/blog/presentation/bloc/dashboard/dashboard_cubit.dart'
    as _i25; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.PhotoRepository>(() => _i3.PhotoRepository());
  gh.factory<_i4.PostRepository>(() => _i4.PostRepository());
  gh.factory<_i5.SavePhoto>(() => _i5.SavePhoto(
      photoRepository: get<_i3.PhotoRepository>(), photo: get<_i6.Photo>()));
  gh.factory<_i7.SavePost>(() => _i7.SavePost(
      postRepository: get<_i4.PostRepository>(), post: get<_i8.Post>()));
  gh.factory<_i9.UpdatePhoto>(() => _i9.UpdatePhoto(
      id: get<int>(),
      photo: get<_i6.Photo>(),
      photoRepository: get<_i3.PhotoRepository>()));
  gh.factory<_i10.UpdatePost>(() =>
      _i10.UpdatePost(get<int>(), get<_i8.Post>(), get<_i4.PostRepository>()));
  gh.factory<_i11.UserRepository>(() => _i11.UserRepository());
  gh.factory<_i12.DeletePhoto>(
      () => _i12.DeletePhoto(get<_i3.PhotoRepository>(), get<int>()));
  gh.factory<_i13.DeletePost>(
      () => _i13.DeletePost(get<_i4.PostRepository>(), get<int>()));
  gh.factory<_i14.DeleteUser>(
      () => _i14.DeleteUser(get<_i11.UserRepository>(), get<int>()));
  gh.factory<_i15.FindAllPhotos>(
      () => _i15.FindAllPhotos(get<_i3.PhotoRepository>()));
  gh.factory<_i16.FindAllPosts>(
      () => _i16.FindAllPosts(get<_i4.PostRepository>()));
  gh.factory<_i17.FindAllPostsByUser>(
      () => _i17.FindAllPostsByUser(get<_i4.PostRepository>(), get<int>()));
  gh.factory<_i18.FindAllUsers>(
      () => _i18.FindAllUsers(get<_i11.UserRepository>()));
  gh.factory<_i19.FindByIdPhoto>(
      () => _i19.FindByIdPhoto(get<_i3.PhotoRepository>(), get<int>()));
  gh.factory<_i20.FindByIdPost>(
      () => _i20.FindByIdPost(get<_i4.PostRepository>(), get<int>()));
  gh.factory<_i21.FindByIdUser>(
      () => _i21.FindByIdUser(get<_i11.UserRepository>(), get<int>()));
  gh.factory<_i22.SaveUser>(
      () => _i22.SaveUser(get<_i11.UserRepository>(), get<_i23.User>()));
  gh.factory<_i24.UpdateUser>(() => _i24.UpdateUser(
      get<int>(), get<_i23.User>(), get<_i11.UserRepository>()));
  gh.factory<_i25.DashboardCubit>(
      () => _i25.DashboardCubit(get<_i15.FindAllPhotos>()));
  return get;
}
