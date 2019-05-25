import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<_HomePopupMenu> _menus = [
    _HomePopupMenu(title: 'Refresh', icon: Icons.refresh),
    _HomePopupMenu(title: 'Settings', icon: Icons.settings)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('What Movies',
            style: TextStyle(
              fontFamily: 'Lato',
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          onPressed: _showModalBottomSheet,
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<_HomePopupMenu>(
            elevation: 3.0,
            icon: Icon(Icons.more_vert, color: Colors.black),
            onSelected: _selectMenu,
            itemBuilder: (_) {
              return _menus
                  .map((menu) => PopupMenuItem<_HomePopupMenu>(
                        value: menu,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(menu.icon),
                            SizedBox(width: 16.0),
                            Text(
                              menu.title,
                              style: TextStyle(fontFamily: 'Lato'),
                            ),
                          ],
                        ),
                      ))
                  .toList();
            },
          )
        ],
      ),
    );
  }

  _showModalBottomSheet() {
    _scaffoldKey.currentState.showBottomSheet<void>((_) {
      return Container(
        height: 300.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25.0),
            topRight: const Radius.circular(25.0)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20.0,
              spreadRadius: 7.0,
              offset: Offset(
                0.0,
                0.0
              )
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_drop_down),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.history),
                    title: Text(
                      'Recentyl view',
                      style: TextStyle(
                        fontFamily: 'Lato'
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.bookmark),
                    title: Text(
                      'Bookmark',
                      style: TextStyle(
                        fontFamily: 'Lato'
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  _selectMenu(_HomePopupMenu menuItem) {
    print('select ${menuItem.title}');
  }
}

class _HomePopupMenu {
  final String title;
  final IconData icon;

  _HomePopupMenu({this.title, this.icon});
}
