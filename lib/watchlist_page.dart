import 'package:flutter/material.dart';
import 'movie_model.dart';
import 'movie_details_page.dart';

const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";

class WatchlistPage extends StatelessWidget {
  final List<Movie> watchlist;

  WatchlistPage({required this.watchlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: watchlist.isEmpty
          ? Center(
              child: Text(
                'No movies in watchlist',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: watchlist.length,
              itemBuilder: (context, index) {
                final movie = watchlist[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: movie.posterPath.isNotEmpty
                        ? Image.network(
                            '$imageBaseUrl${movie.posterPath}',
                            width: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.movie, size: 50),
                          )
                        : Icon(Icons.movie, size: 50),
                    title: Text(movie.title),
                    subtitle: Text(movie.genres.join(', ')),
                    trailing: Icon(Icons.bookmark, color: Colors.blue),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsPage(movie: movie),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}