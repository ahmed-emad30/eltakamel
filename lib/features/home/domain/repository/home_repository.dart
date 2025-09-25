import 'package:eltakamel/features/home/data/model/remaining_days_model.dart';
import 'package:eltakamel/features/home/data/model/user_model.dart';

import '../../data/model/extensions_model.dart' show ExtensionsModel;
import '../../data/model/service_model.dart' show ServiceModel;

abstract class HomeRepository {
  Future<UserModel> getUser();

  Future<ServiceModel> getService();

  Future<RemainingDaysModel> getRemainingDays();

  Future<void> redeem(String pin);

  Future<ExtensionsModel> getExtensions(int profileId);

  Future<void> changeService(int profileId);
}
