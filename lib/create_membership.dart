import 'package:flutter/material.dart';

import 'widgets.dart';

class CreateMembershipWidget extends StatefulWidget {
  const CreateMembershipWidget({Key? key}) : super(key: key);

  @override
  State<CreateMembershipWidget> createState() => _CreateMembershipWidgetState();
}

class _CreateMembershipWidgetState extends State<CreateMembershipWidget> {
  String? description;
  bool allowRollover = false;
  bool autoRenew = false;
  List included = [1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new Membership'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(9),
            child: ElevatedButton(
              onPressed: tapSave,
              child: const Text('Save'),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            title: TextField(
              decoration: InputDecoration(
                label: Text('Membership name'),
              ),
            ),
          ),
          Row(
            children: [
              MoneyInput(),
              const Spacer(),
              if (description == null)
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.symmetric(horizontal: 22),
                  child: TextButton(
                    onPressed: tapAddDescription,
                    child: const Text('Add Description'),
                  ),
                ),
            ],
          ),
          if (description != null)
            const ListTile(
              title: TextField(
                decoration: InputDecoration(
                  label: Text('Description'),
                ),
                maxLines: 3,
              ),
            ),
          SwitchListTile(
            value: allowRollover,
            onChanged: allowRolloverChanged,
            title: const Text('Allow unused sessions to rollover'),
          ),
          if (allowRollover)
            ListTile(
              title: const Text('Rollover duration in months'),
              trailing: DropdownButton(
                value: '1',
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
            value: autoRenew,
            onChanged: autoRenewChanged,
            title: const Text('Automatically renew membership every month'),
          ),
          if (autoRenew)
            const ListTile(
              title: Text('Auto renewing duration cap'),
              trailing: SizedBox(
                width: 44,
                child: TextField(),
              ),
            ),
          ListTile(
            title: Text('Services included: ${included.length}'),
            trailing: TextButton(
              onPressed: tapAddIncluded,
              child: const Text('Add'),
            ),
          ),
          ...included
              .map(
                (e) => ListTile(
                  title: Card(
                    child: Column(
                      children: [
                        const ListTile(
                          title: Text('All 22 min Acupuncture Services'),
                          trailing: Text('3 per month'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              onPressed: tapEditGroup,
                              child: const Text('Edit'),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }

  void allowRolloverChanged(bool value) {
    setState(() {
      allowRollover = value;
    });
  }

  void tapAddDescription() {
    setState(() {
      description = '';
    });
  }

  void rolloverMonthsChanged(value) {}

  void autoRenewChanged(bool value) {
    setState(() {
      autoRenew = value;
    });
  }

  void tapAddIncluded() {
    setState(() {
      included.add(1);
    });
  }

  void tapEditGroup() {}

  void tapSave() {}
}
