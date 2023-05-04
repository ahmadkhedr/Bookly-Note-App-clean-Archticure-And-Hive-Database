import 'package:bookly/Features/home/data/data_sources/home_remote_datasource.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../Features/home/data/data_sources/home_local_datasource.dart';

final getIt = GetIt.instance;

setUpServiceLocator() {
  getIt.registerFactory<ApiService>(() => ApiService(Dio()));
  getIt.registerFactory<HomeRepoImpl>(() {
    return HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeReomteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
    );
  });
}
