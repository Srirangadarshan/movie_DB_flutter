import 'package:flutter/material.dart';
import 'movie_model.dart';
import 'movies_page.dart';
import 'favourites_page.dart';
import 'watchlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Movie> favourites = [];
  List<Movie> watchlist = [];

  void _addToFavourites(Movie movie) {
    setState(() {
      if (favourites.any((m) => m.id == movie.id)) {
        favourites.removeWhere((m) => m.id == movie.id);
      } else {
        favourites.add(movie);
      }
    });
  }

  void _addToWatchlist(Movie movie) {
    setState(() {
      if (watchlist.any((m) => m.id == movie.id)) {
        watchlist.removeWhere((m) => m.id == movie.id);
      } else {
        watchlist.add(movie);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      MoviesPage(
        favourites: favourites,
        watchlist: watchlist,
        onAddToFavourites: _addToFavourites,
        onAddToWatchlist: _addToWatchlist,
      ),
      FavouritesPage(favourites: favourites),
      WatchlistPage(watchlist: watchlist),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Watchlist',
          ),
        ],
      ),
    );
  }
}