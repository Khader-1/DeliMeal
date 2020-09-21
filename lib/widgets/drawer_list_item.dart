import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {
  final String _title;
  final IconData _icon;

  DrawerListItem(this._title, this._icon);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: Icon(
        _icon,
        size: 26,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        _title,
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
      ),
      onTap: () {},
    );
  }
}
