import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoneyInput extends StatelessWidget {
  final _controller = TextEditingController();
  static const _locale = 'en';
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  MoneyInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 222,
      child: ListTile(
        title: TextField(
          controller: _controller,
          decoration: InputDecoration(
            prefixText: _currency,
            label: const Text('Membership price'),
          ),
          keyboardType: TextInputType.number,
          onChanged: (string) {
            string = _formatNumber(string.replaceAll(',', ''));
            _controller.value = TextEditingValue(
              text: string,
              selection: TextSelection.collapsed(offset: string.length),
            );
          },
        ),
      ),
    );
  }
}
