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
import '../../modules/layout/domain/usecase/search_movie_usecase.dart' as _i82;
import '../../modules/layout/presentation/viewModel/home_cubit.dart' as _i650;
import '../../modules/moviedetails/api/client/movie_details_api_client.dart'
    as _i219;
import '../../modules/moviedetails/api/data_source_impl/moviedetails_remote_datasource_impl.dart'
    as _i894;
import '../../modules/moviedetails/data/data_sources/movie_detalis_remote_datasource.dart'
    as _i696;
import '../../modules/moviedetails/data/repositories/moviedetails_repo_impl.dart'
    as _i150;
import '../../modules/moviedetails/domain/repositories/movie_details_repo.dart'
    as _i175;
import '../../modules/moviedetails/domain/use_cases/movies_details_usecase.dart'
    as _i533;
import '../../modules/moviedetails/presentation/viewmodel/movie_details_cubit.dart'
    as _i884;
import '../../modules/moviedetails/presentation/viewmodel/relates_movies_cubit.dart'
    as _i218;
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
    gh.factory<String>(
      () => dioModule.baseUrl,
      instanceName: 'baseurl',
    );
    gh.lazySingleton<_i361.Dio>(
        () => dioModule.dio(gh<String>(instanceName: 'baseurl')));
    gh.factory<_i1050.HomeApiClient>(() => _i1050.HomeApiClient(
          gh<_i361.Dio>(),
          baseUrl: gh<String>(instanceName: 'baseurl'),
        ));
    gh.factory<_i219.MovieDetailsApiClient>(() => _i219.MovieDetailsApiClient(
          gh<_i361.Dio>(),
          baseUrl: gh<String>(instanceName: 'baseurl'),
        ));
    gh.lazySingleton<_i696.MovieDetailsRemoteDataSource>(() =>
        _i894.MovieDetailsRemoteDataSourceImpl(
            gh<_i219.MovieDetailsApiClient>()));
    gh.lazySingleton<_i204.HomeRemoteDataSource>(
        () => _i602.HomeRemoteDataSourceImpl(gh<_i1050.HomeApiClient>()));
    gh.lazySingleton<_i175.MovieDetailsRepo>(() =>
        _i150.MovieDetailsRepoImpl(gh<_i696.MovieDetailsRemoteDataSource>()));
    gh.lazySingleton<_i263.HomeRepo>(
        () => _i978.HomeRepoImpl(gh<_i204.HomeRemoteDataSource>()));
    gh.factory<_i533.GetMovieDetailsUseCase>(
        () => _i533.GetMovieDetailsUseCase(gh<_i175.MovieDetailsRepo>()));
    gh.factory<_i884.MovieDetailsCubit>(
        () => _i884.MovieDetailsCubit(gh<_i533.GetMovieDetailsUseCase>()));
    gh.factory<_i218.RelatedMoviesCubit>(
        () => _i218.RelatedMoviesCubit(gh<_i533.GetMovieDetailsUseCase>()));
    gh.lazySingleton<_i986.GetMoviesListUseCase>(
        () => _i986.GetMoviesListUseCase(gh<_i263.HomeRepo>()));
    gh.lazySingleton<_i82.SearchMoviesUseCase>(
        () => _i82.SearchMoviesUseCase(gh<_i263.HomeRepo>()));
    gh.factory<_i650.HomeCubit>(
        () => _i650.HomeCubit(gh<_i986.GetMoviesListUseCase>()));
    return this;
  }
}

class _$DioModule extends _i484.DioModule {}
