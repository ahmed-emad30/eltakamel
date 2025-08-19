import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:eltakamel/core/helpers/helper_functions/network_status.dart';
import 'package:eltakamel/core/api/api_request_helpers/api_consumer.dart';
import 'package:eltakamel/core/api/api_request_helpers/dio_consumer.dart';
import 'package:get_it/get_it.dart';
import 'package:eltakamel/features/shared/presentation/shared_screen/logic/shared_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static Future<void> init() async {
    /// Core Feature
    // sl.registerFactory<GlobalCubit>(() => GlobalCubit());

    _setupMeasurementsFeature();

    /// Core
    sl.registerLazySingleton<NetworkStatus>(
      () => NetworkStatusImp(sl<InternetConnection>()),
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
}
