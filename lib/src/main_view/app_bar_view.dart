import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../settings/settings_view.dart';

class AppBarView extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController searchController;
  final void Function(String) onSearchChanged;

  AppBarView({
    required this.searchController,
    required this.onSearchChanged,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  onClearSearch() {
    searchController.clear();
    onSearchChanged('');
  }

  Widget buildSearchSuffixIcon() {
    return searchController.text.isNotEmpty
        ? IconButton(
            icon: Icon(Icons.clear, color: Colors.red),
            onPressed: onClearSearch,
          )
        : Icon(Icons.search, color: Colors.grey);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.searchPlaceholder,
          hintStyle: TextStyle(color: Colors.grey),
          suffixIcon: buildSearchSuffixIcon(),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          isDense: true,
        ),
        style: TextStyle(fontSize: 18.0, height: 1.0, color: Colors.black),
        onChanged: onSearchChanged,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.pushNamed(context, SettingsView.routeName);
          },
          iconSize: 30.0,
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            Navigator.pushNamed(context, SettingsView.routeName);
          },
          iconSize: 30.0,
        ),
      ],
    );
  }
}
