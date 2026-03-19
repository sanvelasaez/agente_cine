/// Enum representing the movie list categories on the home screen
enum MovieCategory {
  trending('Trending Now'),
  popular('Popular'),
  topRated('Top Rated'),
  upcoming('Upcoming'),
  nowPlaying('Now Playing');

  const MovieCategory(this.title);

  final String title;
}
