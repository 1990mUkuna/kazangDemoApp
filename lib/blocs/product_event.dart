import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class ProductRequestedEvent extends ProductEvent {
  @override
  List<Object> get props => [];
}

class ProductRefreshRequested extends ProductEvent {
  const ProductRefreshRequested();

  @override
  List<Object> get props => [];
}
 