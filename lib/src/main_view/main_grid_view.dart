import 'package:flutter/material.dart';

import 'account.dart';
import 'grid_item_view.dart';

class MainGridView extends StatelessWidget {
  final List<Account> accounts;
  final void Function(Account) onSelectAccount;

  MainGridView({
    required this.accounts,
    required this.onSelectAccount,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: accounts.length,
      itemBuilder: (BuildContext context, int index) {
        final account = accounts[index];

        return GestureDetector(
            onTap: () => onSelectAccount(account),
            child: GridItemView(account: account));
      },
    );
  }
}
