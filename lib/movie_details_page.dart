import 'package:flutter/material.dart';
import 'movie_model.dart';

const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  MovieDetailsPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Image
            Container(
              height: 200,
              width: double.infinity,
              child: movie.backdropPath.isNotEmpty
                  ? Image.network(
                      '$imageBaseUrl${movie.backdropPath}',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Container(
                            color: Colors.grey[300],
                            child: Icon(Icons.movie, size: 100),
                          ),
                    )
                  : Container(
                      color: Colors.grey[300],
                      child: Icon(Icons.movie, size: 100),
                    ),
            ),
            
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Movie Title
                  Text(
                    movie.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  // Rating
                  Row(
                    children: [
                      Text(
                        'Rating: ',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          value: movie.voteAverage / 10,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                          strokeWidth: 6,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '${movie.voteAverage.toStringAsFixed(1)}/10',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  
                  // Release Date
                  Text(
                    'Release Date: ${movie.releaseDate}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  
                  // Genre
                  Text(
                    'Genre: ${movie.genres.join(', ')}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  
                  // Description
                  Text(
                    'Description:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    movie.overview.isNotEmpty ? movie.overview : 'No description available',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 32),
                  
                  // Play Now Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Movie is Playing')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      ),
                      child: Text(
                        'Play Now',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}