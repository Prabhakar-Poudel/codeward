import 'package:flutter/material.dart';
import 'account.dart';
import 'selected_account_view.dart';
import 'main_grid_view.dart';

class BodyView extends StatelessWidget {
  final List<Account> accounts;
  final Account selectedAccount;
  final void Function(Account) onSelectAccount;

  BodyView({
    required this.accounts,
    required this.selectedAccount,
    required this.onSelectAccount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(child: SelectedAccountView(account: selectedAccount)),
      Expanded(
          child: MainGridView(
              accounts: accounts, onSelectAccount: onSelectAccount)),
    ]);
  }
}
