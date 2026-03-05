import 'package:flutter/material.dart';

import '../../../exports.dart';

class ViewLogsActions extends StatefulWidget {
  final ViewLogsActionsController controller;
  const ViewLogsActions({super.key, required this.controller});

  @override
  State<ViewLogsActions> createState() => _ViewLogsActionsState();
}

class _ViewLogsActionsState extends State<ViewLogsActions> {
  ViewLogsActionsController get _refresh => widget.controller;

  bool redirecting() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.grey.shade100,
    appBar: AppBar(
      backgroundColor: UiThemeColors.lightColor,
      title: Text(
        'Bloco de Ações',
        style: UiTextStyles.heading20(color: UiThemeColors.neutral10),
      ),
    ),
    body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: AnimatedBuilder(
        animation: _refresh,
        builder: (_, _) => SingleChildScrollView(
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bt(() async => _refresh.readDataStorage(), 'Ler Tokens e Data de Expiração'),
                bt(() async => _refresh.writeDataStorage(), 'Gravar dados Fakes'),
                bt(() async => _refresh.chageAccessToken(), 'Inativar Access Token'),
              ],
            ),
          ),
      ),
    ),
  );

  TextButton bt(Function() onPressed, String nameButton) => TextButton.icon(
    style: ButtonStyle(padding: WidgetStateProperty.all(EdgeInsets.zero)),
    onPressed: onPressed,
    icon: const Icon(Icons.refresh, color: Colors.black),
    label: Text(nameButton),
  );
}
