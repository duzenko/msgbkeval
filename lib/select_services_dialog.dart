import 'package:flutter/material.dart';

import 'membership_model.dart';

class SelectServicesDialog extends StatefulWidget {
  final MembershipGroupModel model;

  const SelectServicesDialog(this.model, {Key? key}) : super(key: key);

  @override
  State<SelectServicesDialog> createState() => _SelectServicesDialogState();
}

class _SelectServicesDialogState extends State<SelectServicesDialog> {
  MembershipGroupModel get model => widget.model;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Select Services',
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('OK'),
        ),
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('Cancel'),
        ),
      ],
      contentPadding: const EdgeInsets.symmetric(horizontal: 9),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          'Morbi eget enim sed eros convallis tincidunt',
          'Ut a hendrerit enim. Proin aliquet vel diam et iaculis',
          'Donec fringilla pellentesque dignissim',
          'Sed tincidunt nisl vel elit pulvinar',
          'Duis fringilla sollicitudin eros a euismod',
          'Aliquam mollis porttitor lobortis',
        ]
            .map(
              (e) => CheckboxListTile(
                value: model.services.contains(e),
                title: Text(e),
                onChanged: (b) => tileChecked(e, b),
              ),
            )
            .toList(),
      ),
    );
  }

  tileChecked(e, bool? b) {
    setState(() {
      if (b ?? false) {
        model.services.add(e);
      } else {
        model.services.remove(e);
      }
    });
  }
}
