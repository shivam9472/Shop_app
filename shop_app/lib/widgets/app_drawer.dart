import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('hello FRiend!'),
            automaticallyImplyLeading: false, //it will nerver show back button
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.shop),
              title: Text('shop'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
          Divider(),
          ListTile(
              leading: Icon(Icons.payment),
              title: Text('orders'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/order');
              }),
          Divider(),
          ListTile(
              leading: Icon(Icons.edit),
              title: Text('Manage Product'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/user');
              }),
               Divider(),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
                // Navigator.of(context).pushReplacementNamed('/user');
                Provider.of<Auth>(context,listen: false).logout();
              }),
        ],
      ),
    );
  }
}
