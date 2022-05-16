import 'package:flutter/material.dart';
import 'package:msgbkeval/membership_model.dart';
import 'package:msgbkeval/rollover_dialog.dart';

import 'widgets.dart';

class CreateMembershipWidget extends StatefulWidget {
  const CreateMembershipWidget({Key? key}) : super(key: key);

  @override
  State<CreateMembershipWidget> createState() => _CreateMembershipWidgetState();
}

class _CreateMembershipWidgetState extends State<CreateMembershipWidget> {
  final model = MembershipModel();

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
      body: ListView(
        children: [
          const ListTile(
            title: TextField(
              decoration: InputDecoration(
                label: Text('Membership name'),
              ),
            ),
          ),
          if (model.description != null)
            const ListTile(
              title: TextField(
                decoration: InputDecoration(
                  label: Text('Description'),
                ),
                maxLines: 3,
              ),
            )
          else
            ListTile(
              title: const Text('Description not set'),
              trailing: TextButton(
                onPressed: tapAddDescription,
                child: const Text('Add'),
              ),
            ),
          Container(height: 22),
          MoneyInput(),
          Container(height: 22),
          ListTile(
            title: Text(model.rolloverRenewText),
            trailing: TextButton(
              onPressed: tapEditRollover,
              child: const Text('Change'),
            ),
          ),
          Container(height: 22),
          ListTile(
            title: Text('Services included: ${model.included.length}'),
            trailing: TextButton(
              onPressed: tapAddIncluded,
              child: const Text('Add'),
            ),
          ),
          ...model.included.map(buildIncluded).toList(),
        ],
      ),
    );
  }

  void tapAddDescription() {
    setState(() {
      model.description = '';
    });
  }

  void tapAddIncluded() {
    setState(() {
      model.included.add(1);
    });
  }

  void tapEditGroup() {}

  void tapSave() {}

  Future<void> tapEditRollover() async {
    await showDialog(
      context: context,
      builder: (c) => MembershipRolloverWidget(model),
    );
    setState(() {});
  }

  buildIncluded(e) {
    return ListTile(
      title: Card(
        child: Column(
          children: [
            ListTile(
              title: const Text('3 per month'),
              subtitle: const Text('All 22 min Acupuncture Services'),
              trailing: TextButton(
                onPressed: tapEditGroup,
                child: const Text('Edit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
