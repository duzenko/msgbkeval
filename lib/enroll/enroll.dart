import 'package:flutter/material.dart';

import 'payment_method_dialog.dart';
import 'select_membership_dialog.dart';

class EnrollWidget extends StatefulWidget {
  const EnrollWidget({Key? key}) : super(key: key);

  @override
  State<EnrollWidget> createState() => _EnrollWidgetState();
}

class _EnrollWidgetState extends State<EnrollWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Active Memberships',
                style: Theme.of(context).textTheme.headline6,
              ),
              ElevatedButton(
                onPressed: tapPurchase,
                child: const Text('Purchase'),
              ),
            ],
          ),
          const ListTile(
            title: Text('None right now'),
          ),
          const SizedBox(height: 11),
          Text(
            'Expired Memberships',
            style: Theme.of(context).textTheme.headline6,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: const ListTile(
              title: Text('Lorem ipsum \$22'),
              subtitle: Text('Cancelled on May 17, 2022'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> tapPurchase() async {
    final x = await showDialog(
      context: context,
      builder: (c) => const SelectMembershipDialog(),
    );
    if (x == null) return;
    await showDialog(
      context: context,
      builder: (c) => const PaymentMethodDialog(),
    );
  }
}
