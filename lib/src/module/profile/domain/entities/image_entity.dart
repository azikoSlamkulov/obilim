import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ImageEntity extends Equatable {
  final Image? image;

  const ImageEntity({
    this.image,
  });

  @override
  List<Object?> get props => [
        image,
      ];
}
