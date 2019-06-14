import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:whats_movies/blocs/popular_peoples/bloc.dart';
import 'package:whats_movies/domains/people.dart';

class PeopleScreen extends StatefulWidget {
  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {

  PopularPeoplesBloc _popularPeoplesBloc;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _popularPeoplesBloc = BlocProvider.of<PopularPeoplesBloc>(context);
    _popularPeoplesBloc.dispatch(FetchPeoples());
    _scrollController.addListener(_onScroll);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _popularPeoplesBloc,
      builder: (_, PopularPeoplesState state) {

        if (state is InitialPopularPeoplesState) {

          return Center(child: CircularProgressIndicator());
        }

        if (state is LoadedPopularPeoplesState) {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                controller: _scrollController,
                itemCount: state.hasReachedMax
                            ? state.peoples.length
                            : state.peoples.length + 1,
                itemBuilder: (_, index) {
                  return index >= state.peoples.length
                          ? state.occuredError
                            ? _bottomContinePage(state.page)
                            : _bottomLoading()
                          : _buildPeopleItem(state.peoples[index]);
                },
              ));
        }

        if (state is ErrorPopularPeoplesState) {

          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      onPressed: () => _popularPeoplesBloc.dispatch(FetchPeoples()),
                      icon: Icon(Icons.refresh, size: 35.0)),
                  Text(
                    'Reload popular peoples',
                    style: TextStyle(fontFamily: 'Lato'),
                  )
                ],
              ),
            );
        }
      },
    );
  }

  Widget _bottomContinePage(int page) {

    return Container(
      height: 80.0,
      padding: EdgeInsets.all(6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Occured error at page: $page',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 16
            ),
          ),
          FlatButton.icon(
            label: Text(
              'Try again'
            ),
            onPressed: () => _popularPeoplesBloc.dispatch(FetchPeoples()),
            icon: Icon(Icons.refresh)
          )
        ],
      ),
    );
  }

  Widget _bottomLoading() {

    return Container(
      height: 70.0,
      padding: EdgeInsets.all(6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircularProgressIndicator(strokeWidth: 3.0),
          Text(
            'Wait to loaded item',
            style: TextStyle(
              fontFamily: 'Lato'
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPeopleItem(People people) {
    return Card(
      elevation: 3.0,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        height: 100.0,
        child: Row(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: people.profileUrl,
              width: 80.0,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      people.name,
                      style: TextStyle(fontFamily: 'Lato-Bold', fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      people.filmsToString,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontFamily: 'Lato', fontSize: 13.0),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onScroll() {

    final current = _scrollController.position.pixels;
    final max = _scrollController.position.maxScrollExtent;

    if (current == max) {

      _popularPeoplesBloc.dispatch(FetchPeoples());
    }
  }
}
