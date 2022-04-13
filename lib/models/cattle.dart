import 'dart:io';

class Cattle {
  final String id;
  final String name;
  final String description;
  final double weightKg;
  final double weightArroba;
  final File image;
  final double growthRate;

  Cattle({
    required this.id,
    required this.name,
    required this.description,
    required this.weightKg,
    required this.weightArroba,
    required this.image,
    required this.growthRate,
  });
}