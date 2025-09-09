// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../modules/layout/api/client/home_api_client.dart' as _i1050;
import '../../modules/layout/api/data_source_impl/home_remote_datasource_impl.dart'
    as _i602;
import '../../modules/layout/data/datasource/home_remote_datasource.dart'
    as _i204;
import '../../modules/layout/data/repo_impl/home_repo_impl.dart' as _i978;
import '../../modules/layout/domain/repo/home_repo.dart' as _i263;
import '../../modules/layout/domain/usecase/get_movies_list_usecase.dart'
    as _i986;
import 'dio_module/dio_module.dart' as _i484;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(
        () => dioModule.dio(gh<String>(instanceName: 'baseurl')));
    gh.factory<_i1050.HomeApiClient>(() => _i1050.HomeApiClient(
          gh<_i361.Dio>(),
          baseUrl: gh<String>(instanceName: 'baseurl'),
        ));
    gh.lazySingleton<_i204.HomeRemoteDataSource>(
        () => _i602.HomeRemoteDataSourceImpl(gh<_i1050.HomeApiClient>()));
    gh.lazySingleton<_i263.HomeRepo>(
        () => _i978.HomeRepoImpl(gh<_i204.HomeRemoteDataSource>()));
    gh.lazySingleton<_i986.GetMoviesListUseCase>(
        () => _i986.GetMoviesListUseCase(gh<_i263.HomeRepo>()));
    return this;
  }
}

class _$DioModule extends _i484.DioModule {}
