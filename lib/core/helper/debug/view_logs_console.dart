
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../exports.dart';

class ViewLogsConsole extends StatefulWidget {
  const ViewLogsConsole({super.key});

  @override
  State<ViewLogsConsole> createState() => _ViewLogsConsoleState();
}

class _ViewLogsConsoleState extends State<ViewLogsConsole> {
  final OnboardingStore _storage = Modular.get<OnboardingStore>();

  final _viewActions = ViewLogsActionsController(
  );

  int itemExpanded = 9999990000999;

  void setExpanded(int p0) {
    final int pointer = p0 == itemExpanded ? 999999000099999 : p0;
    setState(() => itemExpanded = pointer);
  }

  @override
  void initState() {
    setExpanded(999999000099999);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool redirecting() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
      return true;
    }
    return false;
  }

  void redirecting2() {
    if (Navigator.of(context).canPop()) {
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (context) => ViewLogsActions(
            controller: _viewActions,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: UiThemeColors.neutral10,
        title: const Text(
          'Logs da aplicação',
        ),
        actions: [
          TextButton.icon(
            onPressed: () => redirecting2(),
            icon: const Icon(
              Icons.read_more,
              color: Colors.black,
            ),
            label: const Text(
              'Ações',
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: ValueListenableBuilder(
          valueListenable: _storage.offers,
          builder: (_, list, child) {
            final List<ItemStorage> reversedList = list.reversed.toList();
            return ListView.separated(
              itemBuilder: (context, index) {
                final ItemStorage item = reversedList[index];
                return Card(
                  elevation: 2,
                  child: ExpansionPanelList(
                    elevation: 0,
                    animationDuration: const Duration(milliseconds: 500),
                    expansionCallback: (panelIndex, isExpanded) => setExpanded(index),
                    dividerColor: UiThemeColors.primary,
                    children: <ExpansionPanel>[
                      ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (context, isExpanded) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          child: RichText(
                            text: TextSpan(
                              text: item.dateTime.toString(),
                              style: UiTextStyles.body12(),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' - ${item.label}',
                                  style:UiTextStyles.body12(color: UiThemeColors.primary,),
                                ),
                              ],
                            ),
                          ),
                        ),
                        body: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                textSpanTitle(
                                  title: 'Data Hora',
                                  styleDefault: UiTextStyles.body12()
                                ),
                                textSpanSubTitle(
                                  subTitle: item.dateTime.toString(),
                                  styleDefault: UiTextStyles.body12()
                                ),
                                textSpanTitle(
                                  title: 'Arquivo',
                                  styleDefault: UiTextStyles.body12()
                                ),
                                textSpanSubTitle(
                                  subTitle: item.label.toString(),
                                  styleDefault: UiTextStyles.body12()
                                ),
                                textSpanTitle(
                                  title: 'Motivo da falha',
                                  styleDefault: UiTextStyles.body12()
                                ),
                                textSpanSubTitle(
                                  subTitle: item.error.toString(),
                                  styleDefault: UiTextStyles.body12()
                                ),
                                textSpanTitle(
                                  title: 'StackTrace',
                                  styleDefault: UiTextStyles.body12()
                                ),
                                textSpanSubTitle(
                                  subTitle: item.stackTrace.toString(),
                                  styleDefault: UiTextStyles.body12()
                                ),
                              ],
                            ),
                          ),
                        ),
                        isExpanded: itemExpanded == index,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: list.length,
            );
          },
        ),
      ),
    );
}

TextSpan textSpanTitle({
  String title = '',
  required TextStyle styleDefault,
}) =>
    TextSpan(
      text: '$title: ',
      style: TextStyle(
        fontFamily: styleDefault.fontFamily,
        fontWeight: styleDefault.fontWeight,
        color: UiThemeColors.primary,
      ),
    );
TextSpan textSpanSubTitle({
  String subTitle = '',
  required TextStyle styleDefault,
}) =>
    TextSpan(
      text: '$subTitle \n\n',
      style: UiTextStyles.body12(color: UiThemeColors.primary),
    );
