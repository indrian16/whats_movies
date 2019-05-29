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

  MenuBloc _menuBloc = MenuBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _menuBloc,
      builder: (_, MenuState state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {},
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
              style: TextStyle(
                fontFamily: 'Lato'
              ),
            ),
          ),
          body: _bodyScreen(state),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentTab,
            onTap: _onTapBottomNav,
            fixedColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontFamily: 'Lato'
                  ),
                )
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text(
                  'People',
                  style: TextStyle(
                    fontFamily: 'Lato'
                  ),
                )
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.find_in_page),
                title: Text(
                  'Discover',
                  style: TextStyle(
                    fontFamily: 'Lato'
                  ),
                )
              )
            ],
          ),
        );
      },
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