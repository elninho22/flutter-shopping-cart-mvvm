import 'package:flutter/material.dart';
import '../../../../exports.dart';

class OrderConfirmationPage extends StatelessWidget {
  const OrderConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Pedido Finalizado', style: UiTextStyles.heading20()),
      automaticallyImplyLeading: false,
    ),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check,
              color: UiThemeColors.sucess,
              size: 40,
            ),
            Text('Pedido realizado com sucesso!', style: UiTextStyles.heading24()),
            Text(
              'Seu pedido foi enviado e será processado em breve.',
              style: UiTextStyles.heading16(),
              textAlign: TextAlign.center,
            ),
            UiButton.filled(
              expanded: true,
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.catalog,
                (route) => false,
              ),
              label: 'Novo Pedido',
              textColor: UiThemeColors.black,
            ),
          ],
        ),
      ),
    ),
  );
}
