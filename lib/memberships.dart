import 'package:flutter/material.dart';

class MembershipsWidget extends StatefulWidget {
  const MembershipsWidget({Key? key}) : super(key: key);

  @override
  createState() => _MembershipsWidgetState();
}

class _MembershipsWidgetState extends State<MembershipsWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.8,
        // heightFactor: 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.card_membership, size: 66),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 11),
              child: Text(
                'Create predictable income with Memberships',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            ...[
              'Memberships encourage your clients to book appointments every month at lower membership rates. Easily create as many custom Membership Plans as you like.',
              'Clients are automatically billed each month and you’ll enjoy having a predictable stream of income to rely on. Your clients win too with more frequent visits.',
              'The best part? It’ll take almost no time to manage your Membership program. MassageBook keeps clear, easy to understand records of every client’s Membership activity.',
            ].map(
              (s) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 11),
                child: Text(
                  s,
                  // style: Theme.of(context).textTheme.,
                ),
              ),
            ),
            Container(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: tapCreate,
                  child: const Text('Create a Membership'),
                ),
                TextButton(
                  onPressed: tapLearnMore,
                  child: const Text('Learn more'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void tapLearnMore() {}

  void tapCreate() {}
}
