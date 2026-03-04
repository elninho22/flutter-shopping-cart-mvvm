import 'package:flutter/material.dart';

enum BottomSheetType { success, warning, error }

abstract class UiBottomSheet {
  Future<void> show({
    required BuildContext context,
    required BottomSheetType type,
    required String title,
    required String message,
    required String action,
    VoidCallback? onAction,
  });
}