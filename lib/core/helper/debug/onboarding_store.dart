import 'package:flutter/material.dart';
import '../../../exports.dart';

typedef V<T> = ValueNotifier<T>;

class OnboardingStore {
  final offers = V<List<ItemStorage>>([]);

  void setEmptyList() => offers.value.clear();

  void setError({
    String? typeError,
    String? label,
    dynamic error,
    dynamic stackTrace,
    int maxFrames = 3000,
  }) {
    final String dateTime = HelperDatetime.formatDate(
      DateTime.now(),
      HelperDatetime.dateHourFormat,
    );
    final dynamic errorData = error.toString().length >= maxFrames
        ? error.toString().substring(0, maxFrames)
        : error.toString();
    final ItemStorage dataItemStorage = ItemStorage(
      typeError: typeError,
      label: label,
      error: errorData,
      stackTrace: stackTrace,
      dateTime: dateTime,
    );
    offers.value.add(dataItemStorage);
  }
}

class ItemStorage {
  final String? typeError;
  final String? label;
  final dynamic error;
  final String? dateTime;
  final dynamic stackTrace;

  ItemStorage({
    this.typeError,
    this.label,
    this.error,
    this.stackTrace,
    this.dateTime,
  });
}
