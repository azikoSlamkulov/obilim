import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int? id;
  final String? name;
  final bool? isActive;
  final String? imageUrl;

  const CategoryEntity({
    this.id,
    this.name,
    this.isActive,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        isActive,
        imageUrl,
      ];
}
