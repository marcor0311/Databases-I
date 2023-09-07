package tec.bd.service;
import java.util.List;
import java.util.Optional;
import tec.bd.entity.MovieEntity;
public interface MovieService {
    List<MovieEntity> getMovies();
    Optional<MovieEntity> getMovieById(int movieId);
    MovieEntity newMovie(MovieEntity movie);
    void removeMovie(int movieId);
    MovieEntity updateMovie(MovieEntity movie);
    void printMovie(MovieEntity movie);
}
