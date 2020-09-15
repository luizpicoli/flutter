import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'Sistema de suporte de T.I',
              ),
              accountEmail: Text(
                'suporte@gmail.com',
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Suporte'),
              subtitle: Text('Ordem de serviço'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // print('Clicou no menu');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
