import 'package:flutter/material.dart';
import 'movie_model.dart';
import 'movie_details_page.dart';

const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";

class FavouritesPage extends StatelessWidget {
  final List<Movie> favourites;

  FavouritesPage({required this.favourites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: favourites.isEmpty
          ? Center(
              child: Text(
                'No favourite movies',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: favourites.length,
              itemBuilder: (context, index) {
                final movie = favourites[index];
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
                    trailing: Icon(Icons.favorite, color: Colors.red),
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