import '../../../../core/api/api_request_helpers/dio_consumer.dart';
import '../../../../core/api/api_request_helpers/end_points.dart';
import '../model/package_model.dart';

abstract class PackagesRemoteDataSource {
  Future<List<PackageModel>> getPackages();
}

class PackagesRemoteDataSourceImp implements PackagesRemoteDataSource {
  final DioConsumer dioConsumer;

  PackagesRemoteDataSourceImp({required this.dioConsumer});

  @override
  Future<List<PackageModel>> getPackages() async {
    try {
      final response = await dioConsumer.get(EndPoints.packages);
      
      if (response != null && response.statusCode == 200) {
        // التحقق من وجود البيانات في الاستجابة
        if (response.data != null) {
          // إذا كانت البيانات مباشرة في الاستجابة كقائمة
          if (response.data is List) {
            return (response.data as List)
                .map((package) => PackageModel.fromJson(package as Map<String, dynamic>))
                .toList();
          }
          // إذا كانت البيانات محاطة بـ GlobalResponse
          else if (response.data is Map<String, dynamic>) {
            final Map<String, dynamic> responseMap = response.data;
            
            // التحقق من وجود مفتاح data
            if (responseMap.containsKey('data')) {
              final data = responseMap['data'];
              if (data is List) {
                return data
                    .map((package) => PackageModel.fromJson(package as Map<String, dynamic>))
                    .toList();
              }
            } else {
              // في حالة كانت البيانات مباشرة في response.data
              return [PackageModel.fromJson(responseMap)];
            }
          }
        }
      }
      
      throw Exception('Failed to load packages');
    } catch (e) {
      throw Exception('Error loading packages: $e');
    }
  }
}
