import 'package:equatable/equatable.dart';

class SavingsEntity extends Equatable {
  final String id;
  final String name;
  final int yield;

  const SavingsEntity({
    required this.id,
    required this.name,
    required this.yield,
  });

  @override
  List<Object?> get props => [id, name, yield];
}
