import 'package:equatable/equatable.dart';

class UserPhotoEntity extends Equatable {
  final int? id;
  final String? uuid;
  final String? filename;
  final String? filePath;
  final String? createdBy;
  final String? createdDate;
  final String? lastModifiedBy;
  final String? lastModifiedDate;
  final String? type;

  const UserPhotoEntity({
    this.id,
    this.uuid,
    this.filename,
    this.filePath,
    this.createdBy,
    this.createdDate,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.type,
  });

  @override
  List<Object?> get props => [
        id,
        uuid,
        filename,
        filePath,
        createdBy,
        createdDate,
        lastModifiedBy,
        lastModifiedDate,
        type,
      ];
}
