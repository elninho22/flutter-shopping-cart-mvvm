import 'package:flutter/material.dart';
import '../../../exports.dart';

class UiBottomSheetImpl implements UiBottomSheet {
  @override
  Future<void> show({
    required BuildContext context,
    required BottomSheetType type,
    required String title,
    required String message,
    required String action,
    VoidCallback? onAction,
  }) => showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => _BottomSheetContent(
      type: type,
      title: title,
      message: message,
      action: action,
      onAction: onAction ?? () => Navigator.of(context).pop(),
    ),
  );
}

class _BottomSheetContent extends StatelessWidget {
  final BottomSheetType type;
  final String title;
  final String message;
  final String action;
  final VoidCallback onAction;

  const _BottomSheetContent({
    required this.type,
    required this.title,
    required this.message,
    required this.action,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(
      color: UiThemeColors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    padding: const EdgeInsets.all(24),
    child: Column(
      spacing: 16,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: UiThemeColors.lightColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        _buildIcon(),
        Text(
          title,
          style: UiTextStyles.heading20(
            fontWeight: FontWeight.bold,
            color: UiThemeColors.darkColor,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          message,
          style: UiTextStyles.body14(color: UiThemeColors.neutral80),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: double.infinity,
          child: UiButton.filled(
            onPressed: onAction,
            label: action,
          ),
        ),
        const SizedBox(height: 100),
      ],
    ),
  );

  Widget _buildIcon() {
    final (color, icon) = switch (type) {
      BottomSheetType.success => (UiThemeColors.sucess, Icons.check_circle_outline),
      BottomSheetType.warning => (UiThemeColors.lightColor, Icons.warning_amber_outlined),
      BottomSheetType.error => (UiThemeColors.error, Icons.error_outline),
    };

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color.withAlpha(1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: color,
        size: 30,
      ),
    );
  }
}
