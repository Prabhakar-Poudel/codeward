import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'account.dart';
import 'package:codeward/src/utils/icon_utils.dart';

class SelectedAccountView extends StatelessWidget {
  final Account account;

  SelectedAccountView({
    required this.account,
  });

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: account.code));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.clipboardCopied)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildIcon(codePoint: account.logoCodePoint, size: 64),
          Text(
            account.issuer,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            account.name,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.green),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              account.code.substring(0, 3),
              style: TextStyle(fontSize: 48, fontFamily: 'monospace'),
            ),
            SizedBox(width: 8),
            Text(
              account.code.substring(3),
              style: TextStyle(fontSize: 48, fontFamily: 'monospace'),
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.copy),
              onPressed: () {
                _copyToClipboard(context);
              },
              iconSize: 32.0,
            ),
          ])
        ],
      ),
    );
  }
}
