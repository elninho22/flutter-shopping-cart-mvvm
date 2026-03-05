import 'package:flutter/material.dart';

import 'ui_library.dart';

class LoadingDefault extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadingDefault({
    super.key,
    required this.child,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      child,
      Visibility(
        visible: isLoading,
        child: ColoredBox(
          color: UiThemeColors.neutral50.withValues(alpha: 0.6),
          child: const Center(
            child: CircularProgressIndicator(color: UiThemeColors.primary),
          ),
        ),
      ),
    ],
  );
}
