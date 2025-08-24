import 'package:equatable/equatable.dart';

class PackageEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String price;

  const PackageEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [id, title, description, price];
}
