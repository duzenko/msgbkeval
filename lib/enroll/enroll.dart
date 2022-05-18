// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:msgbkeval/loremipsum/lorem_ipsum.dart';

import 'billing_review_dialog.dart';
import 'payment_method_dialog.dart';
import 'select_membership_dialog.dart';

class EnrollWidget extends StatefulWidget {
  const EnrollWidget({Key? key}) : super(key: key);

  @override
  State<EnrollWidget> createState() => _EnrollWidgetState();
}

class _EnrollWidgetState extends State<EnrollWidget> {
  final memberships = [];

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
                child: Text('Purchase'),
              ),
            ],
          ),
          if (memberships.isEmpty)
            const ListTile(
              title: Text('None right now'),
            )
          else
            ...memberships.map(buildListTile).toList(),
          SizedBox(height: 11),
          Text(
            'Expired Memberships',
            style: Theme.of(context).textTheme.headline6,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: ListTile(
              title: Text('${loremIpsum(words: 2)} \$22'),
              subtitle: Text('Cancelled on May 17, 2022'),
            ),
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(e) {
    return ListTile(
      title: Text('${loremIpsum(words: 2)} \$33'),
      subtitle: Text('Renews on June 18, 2022'),
      trailing: Text('4 credits\navailable'),
    );
  }

  Future<void> tapPurchase() async {
    final x = await showDialog(
      context: context,
      builder: (c) => const SelectMembershipDialog(),
    );
    if (x == null) return;
    final y = await showDialog(
      context: context,
      builder: (c) => const PaymentMethodDialog(),
    );
    if (y == null) return;
    final z = await showDialog(
      context: context,
      builder: (c) => const BillingReviewWidget(),
    );
    if (z == null) return;
    setState(() {
      memberships.add(1);
    });
  }
}
