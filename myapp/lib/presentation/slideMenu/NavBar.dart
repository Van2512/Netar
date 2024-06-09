import 'package:flutter/material.dart';
import 'package:myapp/presentation/account/Account.dart';

import '../login/Login.dart';
import '../admin/dashboard.dart';
import '../admin/product/qlproduct.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Vandnt'),
            accountEmail: Text('vandang25122003@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/avatar.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ), // Image.asset
              ), // ClipOval
            ), // CircleAvatar
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://c1.wallpaperflare.com/preview/753/901/301/mountain-mist-fog-ridge.jpg'),
                fit: BoxFit.cover,
              ), // DecorationImage
            ), // BoxDecoration
          ),
          ListTile(
            leading: Icon(Icons.view_quilt_sharp),
            title: Text('Overview'),
            onTap:(){Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashBoardScreen()),
            );}
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Products'),
              onTap:(){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeProduct()),
              );}
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Staff'),
            onTap:()=>null,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
            onTap:()=>null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: const Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ), // TextStyle
                  ), // Text
                ), // Center
              ), // Container
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap:()=>null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap:()=>null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
              onTap:(){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );}
          ),// UserAccountsDrawerHeader
        ], // ListView children
      ), // ListView
    ); // Drawer
  }
}
