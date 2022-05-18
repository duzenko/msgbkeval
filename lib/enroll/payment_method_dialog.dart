import 'package:flutter/material.dart';

import '../loremipsum/lorem_ipsum.dart';

final List cards = [];

class PaymentMethodDialog extends StatefulWidget {
  const PaymentMethodDialog({Key? key}) : super(key: key);

  @override
  State<PaymentMethodDialog> createState() => _PaymentMethodDialogState();
}

class _PaymentMethodDialogState extends State<PaymentMethodDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(1),
          child: const Text('Next'),
        ),
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('Cancel'),
        ),
      ],
      title: Text(
        'Payment Method',
        style: Theme.of(context).textTheme.headline6,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 9),
      content:
          cards.isEmpty ? const CardDetailsWidget() : const CardListWidget(),
    );
  }

  Widget buildListTile(int e, BuildContext context) {
    return GestureDetector(
      onTap: tapMembership,
      child: ListTile(
        title: Text(loremIpsum(words: 2)),
        subtitle: Text(loremIpsum(words: 4)),
        trailing: Text(
          '\$$e$e/mo',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }

  void tapMembership() {
    Navigator.of(context).pop(1);
  }
}

class CardDetailsWidget extends StatefulWidget {
  const CardDetailsWidget({Key? key}) : super(key: key);

  @override
  State<CardDetailsWidget> createState() => _CardDetailsWidgetState();
}

class _CardDetailsWidgetState extends State<CardDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TextField(
          decoration: InputDecoration(label: Text('Name on Card')),
        ),
        const TextField(
          decoration: InputDecoration(label: Text('Credit card number')),
        ),
        const TextField(
          decoration: InputDecoration(label: Text('Exp (MM/YY)')),
        ),
        Row(
          children: const [
            Expanded(
              child: TextField(
                decoration: InputDecoration(label: Text('CVV')),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(label: Text('ZIP Code')),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CardListWidget extends StatefulWidget {
  const CardListWidget({Key? key}) : super(key: key);

  @override
  State<CardListWidget> createState() => _CardListWidgetState();
}

class _CardListWidgetState extends State<CardListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
