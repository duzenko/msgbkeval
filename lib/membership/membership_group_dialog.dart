import 'package:flutter/material.dart';

import 'membership_model.dart';
import 'select_services_dialog.dart';

class MembershipGroupWidget extends StatefulWidget {
  final MembershipGroupModel model;

  const MembershipGroupWidget(this.model, {Key? key}) : super(key: key);

  @override
  State<MembershipGroupWidget> createState() => _MembershipGroupWidgetState();
}

class _MembershipGroupWidgetState extends State<MembershipGroupWidget> {
  MembershipGroupModel get model => widget.model;

  late final perMonthController =
      TextEditingController(text: model.perMonth.toString());
  late final discountController =
      TextEditingController(text: model.discount.toString());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Edit Membership Group',
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: [
        Row(
          children: [
            const SizedBox(width: 9),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () => Navigator.of(context).pop(Exception()),
              child: const Text('Delete'),
            ),
            const Spacer(),
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('Cancel'),
            ),
          ],
        ),
      ],
      contentPadding: const EdgeInsets.symmetric(horizontal: 9),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Discount %'),
            trailing: SizedBox(
              width: 44,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: discountController,
                onChanged: (s) => model.discount = num.parse(s),
              ),
            ),
          ),
          ListTile(
            title: const Text('# services included each month'),
            trailing: SizedBox(
              width: 44,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: perMonthController,
                onChanged: (s) => model.perMonth = num.parse(s),
              ),
            ),
          ),
          ListTile(
            title: const Text('Services in this group:'),
            subtitle: Text(model.servicesText),
            trailing: TextButton(
              onPressed: selectServices,
              child: const Text('Select'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> selectServices() async {
    await showDialog(
      context: context,
      builder: (c) => SelectServicesDialog(model),
    );
    setState(() {});
  }
}
