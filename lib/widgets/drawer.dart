import 'package:flutter/material.dart';
import 'package:meals/widgets/drawer_list_item.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Welcome to DeliMeal'),
            accountEmail: Text('Cook Up!'),
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.favorite,
                size: 35,
              ),
            ),
          ),
          DrawerListItem('Categories', Icons.restaurant),
          DrawerListItem('Settings', Icons.settings),
        ],
      ),
    );
  }
}
