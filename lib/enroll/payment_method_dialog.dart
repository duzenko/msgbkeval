import 'package:flutter/material.dart';

import '../loremipsum/lorem_ipsum.dart';

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
          onPressed: Navigator.of(context).pop,
          child: const Text('Cancel'),
        ),
      ],
      title: Text(
        'Payment Method',
        style: Theme.of(context).textTheme.headline6,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 9),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [1, 2, 3]
            .map(
              (e) => buildListTile(e, context),
            )
            .toList(),
      ),
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
