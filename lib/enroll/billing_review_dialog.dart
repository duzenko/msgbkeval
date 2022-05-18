// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillingReviewWidget extends StatefulWidget {
  const BillingReviewWidget({Key? key}) : super(key: key);

  @override
  State<BillingReviewWidget> createState() => _BillingReviewWidgetState();
}

class _BillingReviewWidgetState extends State<BillingReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(1),
          child: Text('Confirm'),
        ),
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text('Cancel'),
        ),
      ],
      title: Text(
        'Review billing details',
        style: Theme.of(context).textTheme.headline6,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 9),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Text('Membership'),
            subtitle: Text('Lorem / \$22 per month'),
          ),
          ListTile(
            title: Text('Start date'),
            subtitle: Text(DateFormat('MMM dd, yyyy').format(DateTime.now())),
          ),
          ListTile(
            title: Text('Card on file'),
            subtitle: Text('XXXX-1111'),
          ),
          SizedBox(
            width: double.minPositive,
            child: ListTile(
              title: Text(
                'Receipt and copy of the membership agreement will be sent to customer\'s email upon purchase.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
