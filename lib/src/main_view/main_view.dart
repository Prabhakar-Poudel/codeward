import 'package:flutter/material.dart';

import 'account.dart';
import 'app_bar_view.dart';
import 'body_view.dart';
import 'add_account.dart';

class MainView extends StatefulWidget {
  MainView({super.key});

  static const routeName = '/';

  @override
  // ignore: library_private_types_in_public_api
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  TextEditingController searchController = TextEditingController();
  late Account selectedAccount;

  final List<Account> accounts = [
    Account('foo.bar.baz@email.com', 'GitHub', 0xed07, '123456'),
    Account('foo.bar.baz@email.com', 'vsc', 0xeee9, '123456'),
    Account('foo.bar.baz@email.com', 'Jetbrains', 0xedfd, '123456'),
    Account('foo.bar.baz@email.com', 'Something', 123456789, '123456'),
    Account('foo.bar.baz@email.com', 'Other thing', 123456789, '123456'),
    Account('foo.bar.baz@emaßil.com', 'Twitter', 0xf22f, '123456'),
    Account('foo.bar.baz@email.com', 'Facebook', 0xec93, '123456'),
    Account('foo.bar.baz@email.com', 'Google', 0xed26, '123456'),
    Account('foo.bar.baz@email.com', 'Amazon', 0xea59, '123456'),
  ];

  _MainViewState() {
    selectedAccount = accounts[0];
  }

  List<Account> filterAccounts(String query) {
    return accounts
        .where((account) =>
            account.name.toLowerCase().contains(query.toLowerCase()) ||
            account.issuer.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  onAddAccount(String accountName, String issuer) {
    Account account = Account(accountName, issuer, 0xf059, '123456');
    accounts.add(account);
    setState(() {
      selectedAccount = account;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredAccounts = filterAccounts(searchController.text);

    return Scaffold(
        appBar: AppBarView(
          searchController: searchController,
          onSearchChanged: (value) => setState(() {}),
        ),
        body: BodyView(
          accounts: filteredAccounts,
          selectedAccount: selectedAccount,
          onSelectAccount: (Account account) => setState(() {
            selectedAccount = account;
          }),
        ),
        floatingActionButton: AddAccountButton(onAddAccount: onAddAccount));
  }
}
