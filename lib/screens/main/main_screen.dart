import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whats_movies/blocs/menu/bloc.dart';
import 'package:whats_movies/blocs/menu/menu_bloc.dart';

import 'package:whats_movies/screens/screens.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  MenuBloc _menuBloc = MenuBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _menuBloc,
      builder: (_, MenuState state) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            leading: IconButton(
              onPressed: _openDrawer,
              icon: Icon(Icons.menu),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
              )
            ],
            title: Text(
              'What Movies',
              style: TextStyle(fontFamily: 'Lato'),
            ),
          ),
          body: _bodyScreen(state),
          drawer: _buildDrawer(),
          bottomNavigationBar: _buildBottomNav(state),
        );
      },
    );
  }

  Widget _buildDrawer() {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'assets/icons/icon.png',
                    width: 50.0,
                    height: 50.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'What Movies',
                      style: TextStyle(
                        fontFamily: 'Lato', 
                        color: Colors.white,
                        fontSize: 16.0
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.history, color: Colors.black),
              title: Text(
                'Recently view',
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: Colors.black
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.bookmark, color: Colors.black),
              title: Text(
                'Bookmark',
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: Colors.black
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(MenuState state) {
    return BottomNavigationBar(
      currentIndex: state.currentTab,
      onTap: _onTapBottomNav,
      fixedColor: Colors.black,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(fontFamily: 'Lato'),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(
              'People',
              style: TextStyle(fontFamily: 'Lato'),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page),
            title: Text(
              'Discover',
              style: TextStyle(fontFamily: 'Lato'),
            ))
      ],
    );
  }

  _bodyScreen(MenuState state) {
    if (state is HomeState) {
      return HomeScreen();
    }

    if (state is PeopleState) {
      return PeopleScreen();
    }

    if (state is DiscoverState) {
      return DiscoverScreen();
    }
  }

  _openDrawer() {

    _scaffoldKey.currentState.openDrawer();
  }

  _onTapBottomNav(int index) {
    if (index == 0) {
      _menuBloc.dispatch(SelectHome());
    }

    if (index == 1) {
      _menuBloc.dispatch(SelectPeople());
    }

    if (index == 2) {
      _menuBloc.dispatch(SelectDiscover());
    }
  }

  @override
  void dispose() {
    _menuBloc.dispose();
    super.dispose();
  }
}