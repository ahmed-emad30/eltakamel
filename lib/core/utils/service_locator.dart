import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:eltakamel/core/helpers/helper_functions/network_status.dart';

import 'package:eltakamel/core/api/api_request_helpers/dio_consumer.dart';
import 'package:eltakamel/core/helpers/helper_functions/network_status.dart';
import 'package:eltakamel/features/billing/presentation/billing_screen/logic/billing_cubit.dart';
import 'package:eltakamel/features/home/presentation/home_screen/logic/drawer_cubit/drawer_cubit.dart';
import 'package:eltakamel/features/shared/presentation/shared_screen/logic/shared_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:eltakamel/features/packages/data/data_source/packages_remote_data_source.dart';
import 'package:eltakamel/features/packages/data/repository/packages_repository_imp.dart';
import 'package:eltakamel/features/packages/domain/repository/packages_repository.dart';
import 'package:eltakamel/features/packages/presentation/packages_screen/logic/packages_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static Future<void> init() async {
    /// Core Feature
    // sl.registerFactory<GlobalCubit>(() => GlobalCubit());

    _setupMeasurementsFeature();
    _setupPackagesFeature();

    /// Core
    sl.registerLazySingleton<NetworkStatus>(
      () => NetworkStatusImp(sl<InternetConnection>()),
    );
    sl.registerLazySingleton<BillingCubit>(
          () => BillingCubit(),
    );
    sl.registerLazySingleton<DrawerCubit>(
          () => DrawerCubit(),
    );
    // sl.registerLazySingleton<ApiConsumer>(() => ApiConsumer());

    /// External Packages
    sl.registerLazySingleton<Dio>(() => Dio());
    sl.registerLazySingleton<DioConsumer>(() => DioConsumer());
    sl.registerLazySingleton<SharedCubit>(() => SharedCubit());
    sl.registerLazySingleton<InternetConnection>(
      () => InternetConnection.createInstance(
        customCheckOptions: [
          InternetCheckOption(uri: Uri.parse('https://www.google.com/')),
        ],
      ),
    );
  }

  static void _setupMeasurementsFeature() {
    // /// Home Feature
    // // Blocs
    // sl.registerFactory<HomeCubit>(() => HomeCubit(sl<HomeRepository>()));
    // sl.registerFactoryParam<AvailableTripsCubit, GetTripsQueryParams, dynamic>(
    //     (getTripsQueryParams, params2) => AvailableTripsCubit(
    //           sl<HomeRepository>(),
    //           getTripsQueryParams,
    //         ));
    // sl.registerFactory<SeatsCubit>(() => SeatsCubit(sl<HomeRepository>()));
    // sl.registerFactory<ReservationCubit>(
    //   () => ReservationCubit(sl<ReservationRepository>()),
    // );
    //
    // // // Repository
    // sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImp(
    //       sl<HomeRemoteDataSource>(),
    //       sl<NetworkStatus>(),
    //     ));
    //
    // // // Data Sources
    // sl.registerLazySingleton<HomeRemoteDataSource>(
    //   () => HomeRemoteDataSourceImp(sl<ApiConsumer>()),
    // );
  }

  static void _setupPackagesFeature() {
    /// Packages Feature
    // Cubit
    sl.registerFactory<PackagesCubit>(() => PackagesCubit(repository: sl<PackagesRepository>()));

    // Repository
    sl.registerLazySingleton<PackagesRepository>(() => PackagesRepositoryImp(remoteDataSource: sl<PackagesRemoteDataSource>()));

    // Data Sources
    sl.registerLazySingleton<PackagesRemoteDataSource>(
      () => PackagesRemoteDataSourceImp(dioConsumer: sl<DioConsumer>()),
    );
  }
}
