import 'package:equatable/equatable.dart';

class SubCategoryEntity extends Equatable {
  final int? id;
  final int? categoryId;
  final String? name;
  final String? description;
  final bool? isActive;
  final String? imageUrl;

  const SubCategoryEntity({
    this.id,
    this.categoryId,
    this.name,
    this.description,
    this.isActive,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        categoryId,
        name,
        description,
        isActive,
        imageUrl,
      ];
}
