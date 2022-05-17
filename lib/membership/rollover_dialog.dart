import 'package:flutter/material.dart';

import 'membership_model.dart';

class MembershipRolloverWidget extends StatefulWidget {
  final MembershipModel model;

  const MembershipRolloverWidget(this.model, {Key? key}) : super(key: key);

  @override
  State<MembershipRolloverWidget> createState() => _RolloverWidgetState();
}

class _RolloverWidgetState extends State<MembershipRolloverWidget> {
  MembershipModel get model => widget.model;

  late final renewDurationController =
      TextEditingController(text: model.renewMonths.toString());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Rollover/renew',
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('OK'),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchListTile(
            value: model.allowRollover,
            onChanged: allowRolloverChanged,
            title: const Text('Allow unused sessions to rollover'),
          ),
          if (model.allowRollover)
            ListTile(
              title: const Text('Rollover duration in months'),
              trailing: DropdownButton(
                value: model.renewMonths.toString(),
                items: ['1', '2', '3', '6', '12']
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: rolloverMonthsChanged,
              ),
            ),
          SwitchListTile(
            value: model.autoRenew,
            onChanged: autoRenewChanged,
            title: const Text('Automatically renew membership every month'),
          ),
          if (model.autoRenew)
            ListTile(
              title: const Text('Auto renewing duration cap'),
              trailing: SizedBox(
                width: 44,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: renewDurationController,
                  onChanged: (s) => model.renewMonths = num.parse(s),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void allowRolloverChanged(bool value) {
    setState(() {
      model.allowRollover = value;
    });
  }

  void rolloverMonthsChanged(value) {}

  void autoRenewChanged(bool value) {
    setState(() {
      model.autoRenew = value;
    });
  }
}
