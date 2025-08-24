import 'package:equatable/equatable.dart';

class TicketEntity extends Equatable {
  final String id;
  final String title;
  final String status;
  final String priority;
  final DateTime createdAt;

  const TicketEntity({
    required this.id,
    required this.title,
    required this.status,
    required this.priority,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, title, status, priority, createdAt];
} 