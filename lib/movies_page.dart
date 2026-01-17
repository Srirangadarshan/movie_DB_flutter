import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'movie_model.dart';
import 'movie_details_page.dart';

const String apiKey = "2015568464ce3f6ca5aca4191bd116fb";
const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";

class MoviesPage extends StatefulWidget {
  final List<Movie> favourites;
  final List<Movie> watchlist;
  final Function(Movie) onAddToFavourites;
  final Function(Movie) onAddToWatchlist;

  MoviesPage({
    required this.favourites,
    required this.watchlist,
    required this.onAddToFavourites,
    required this.onAddToWatchlist,
  });

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List<Movie> movies = [];
  List<Movie> filteredMovies = [];
  bool isLoading = true;
  String error = '';
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchMovies();
    searchController.addListener(_filterMovies);
  }

  Future<void> fetchMovies() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        
        setState(() {
          movies = results.map((json) => Movie.fromJson(json)).toList();
          filteredMovies = movies;
          isLoading = false;
        });
      } else {
        setState(() {
          error = 'Failed to load movies';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = 'Network error: $e';
        isLoading = false;
      });
    }
  }

  void _filterMovies() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredMovies = movies
          .where((movie) => movie.title.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : error.isNotEmpty
                    ? Center(child: Text(error))
                    : ListView.builder(
                        itemCount: filteredMovies.length,
                        itemBuilder: (context, index) {
                          final movie = filteredMovies[index];
                          final isFavourite = widget.favourites.any((m) => m.id == movie.id);
                          final isInWatchlist = widget.watchlist.any((m) => m.id == movie.id);
                          
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
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.favorite,
                                      color: isFavourite ? Colors.red : Colors.grey,
                                    ),
                                    onPressed: () => widget.onAddToFavourites(movie),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.bookmark,
                                      color: isInWatchlist ? Colors.blue : Colors.grey,
                                    ),
                                    onPressed: () => widget.onAddToWatchlist(movie),
                                  ),
                                ],
                              ),
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
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}