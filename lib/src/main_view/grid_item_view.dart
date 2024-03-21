import 'package:flutter/material.dart';

import 'package:codeward/src/main_view/account.dart';
import 'package:codeward/src/utils/icon_utils.dart';

class GridItemView extends StatelessWidget {
  final Account account;

  GridItemView({required this.account});

  @override
  Widget build(BuildContext context) {
    final displayName = '${account.issuer} ${account.name}';

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildIcon(issuer: account.issuer, size: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            child: Text(
              displayName,
              style: TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
