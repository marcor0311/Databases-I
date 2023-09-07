package tec.bd.service;
import java.util.List;
import java.util.Optional;
import tec.bd.entity.MovieEntity;
import tec.bd.repository.MovieRepository;
import static java.util.Objects.requireNonNull;
public class MovieServiceImplementation implements MovieService {
    private final MovieRepository movieRepository;
    public MovieServiceImplementation(MovieRepository movieRepository, DatabaseStoredProcedure featureFlags) {
        requireNonNull(movieRepository);
        requireNonNull(featureFlags);
        this.movieRepository = movieRepository;
    }
    @Override
    public List<MovieEntity> getMovies() {
        return movieRepository.findAll();
    }
    @Override
    public Optional<MovieEntity> getMovieById(int movieId) {
        return movieRepository.findById(movieId);
    }
    @Override
    public MovieEntity newMovie(MovieEntity movie) {
        requireNonNull(movie);
        System.out.println("New movie, loading...");
        int newMovieID = movieRepository.save(movie);
        System.out.println("New movie, id is: " + newMovieID);
        movie.setId(newMovieID);
        return movie;
    }
    @Override
    public void removeMovie(int movieId) {
        requireNonNull(movieId);
        System.out.println("Movie is been retired, loading...");
        movieRepository.delete(movieId);
        System.out.println("Movie has been deleted succesfully");
    }
    @Override
    public MovieEntity updateMovie(MovieEntity movie) {
        requireNonNull(movie);
        movieRepository.update(movie);
        return movie;
    }
@Override
    public void printMovie(MovieEntity movie) {
        System.out.println("╔════════════════════════════════════════╗");
        System.out.println("║              Movie Details               ");
        System.out.println("|───────────────┬─────────────────────────");
        System.out.printf("║   ID          │ %d\n", movie.getId());
        System.out.println("|───────────────┼─────────────────────────");
        System.out.printf("║   Title       │ %s\n", movie.getTitle());
        System.out.println("|───────────────┼─────────────────────────");
        System.out.printf("║   Release Date│ %s\n", movie.getReleaseDate());
        System.out.println("|───────────────┼─────────────────────────");
        System.out.printf("║   Category ID │ %s\n", movie.getCategoryID());
        System.out.println("|───────────────┼─────────────────────────");
        System.out.printf("║   Units avail.│ %d\n", movie.getUnitsAvailable());
        System.out.println("╚═══════════════-════════════════════════╝");
    }
}
