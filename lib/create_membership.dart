import 'package:flutter/material.dart';
import 'package:msgbkeval/membership_model.dart';
import 'package:msgbkeval/rollover_dialog.dart';

import 'membership_group_dialog.dart';
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
        title: const Text('Create Membership'),
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

  Future<void> tapAddIncluded() async {
    setState(() {
      model.included.add(MembershipGroupModel());
    });
    await tapEditGroup(model.included.last);
  }

  Future<void> tapEditGroup(MembershipGroupModel model) async {
    final del = await showDialog(
      context: context,
      builder: (c) => MembershipGroupWidget(model),
    );
    setState(() {
      if (del != null) this.model.included.remove(model);
    });
  }

  void tapSave() {}

  Future<void> tapEditRollover() async {
    await showDialog(
      context: context,
      builder: (c) => MembershipRolloverWidget(model),
    );
    setState(() {});
  }

  buildIncluded(MembershipGroupModel e) {
    return ListTile(
      title: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(e.termsText),
              subtitle: Text(e.servicesText),
              trailing: TextButton(
                onPressed: () => tapEditGroup(e),
                child: const Text('Edit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
