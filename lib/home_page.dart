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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  icon: Icons.movie_outlined,
                  selectedIcon: Icons.movie,
                  label: 'Movies',
                  index: 0,
                ),
                _buildNavItem(
                  icon: Icons.favorite_outline,
                  selectedIcon: Icons.favorite,
                  label: 'Favourites',
                  index: 1,
                ),
                _buildNavItem(
                  icon: Icons.bookmark_outline,
                  selectedIcon: Icons.bookmark,
                  label: 'Watchlist',
                  index: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData selectedIcon,
    required String label,
    required int index,
  }) {
    final isSelected = _currentIndex == index;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? selectedIcon : icon,
              color: isSelected ? Colors.white : Colors.grey[600],
              size: 24,
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}