import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddAccountButton extends StatelessWidget {
  final void Function(String, String) onAddAccount;

  AddAccountButton({
    required this.onAddAccount,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            String name = '';
            String issuer = '';

            return AlertDialog(
              title: Text(AppLocalizations.of(context)!.addAccount),
              content: TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter account name',
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: Text(AppLocalizations.of(context)!.cancel),
                ),
                TextButton(
                  onPressed: () {
                    if (name.isNotEmpty) {
                      Navigator.of(context).pop();
                      onAddAccount(name, issuer);
                    }
                  },
                  child: Text(AppLocalizations.of(context)!.add),
                ),
              ],
            );
          },
        );
      },
      backgroundColor: Colors.blue,
      child: Icon(Icons.add),
    );
  }
}
