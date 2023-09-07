package tec.bd.cli.MoviesCommand;
import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.Callable;
import tec.bd.ApplicationContext;
import tec.bd.entity.MovieEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Command(name = "movr", description = "Obtain movies using ID")
public class GetMovieCommand implements Callable<Integer> {
    @Parameters(paramLabel = "<id>", description = "id movie", defaultValue = "0")
    private int movieId;
    private static final Logger logger = LoggerFactory.getLogger(GetMovieCommand.class);

    /**
     * Checks if all movies are requested.
     *
     * @return true if all movies are requested, false otherwise
     */
    private boolean isAllMoviesRequested() {
        return movieId == 0;
    }

    /**
     * Displays all movies.
     */
    private void displayAllMovies() {
        logger.info("\n- All movies have been requested, LOADING ...\n");

        List<MovieEntity> movies = getAllMovies();

        if (movies.isEmpty()) {
            logger.info("No movies found");
        } else {
            for (MovieEntity movie : movies) {
                printMovieDetails(movie);
            }
        }
    }

    private static final ApplicationContext context = ApplicationContext.init();
    /**
     * Retrieves all movies from the database.
     *
     * @return a list of MovieEntity objects representing all movies
     */
    private List<MovieEntity> getAllMovies() {
        return context.movieService.getMovies();
    }

    /**
     * Displays the details of a specific movie.
     */
    private void displayMovieById() {
        Optional<MovieEntity> movie = getMovieById();

        if (movie.isPresent()) {
            printMovieDetails(movie.get());
        } else {
            logger.info("Movie does not exist");
        }
    }

    /**
     * Retrieves a movie by its ID.
     *
     * @return an Optional containing the MovieEntity object if it exists, otherwise an empty Optional
     */
    private Optional<MovieEntity> getMovieById() {
        return context.movieService.getMovieById(movieId);
    }

    /**
     * Prints the details of a movie.
     *
     * @param movie the MovieEntity object representing the movie
     */
    private void printMovieDetails(MovieEntity movie) {
        context.movieService.printMovie(movie);
    }
    @Override
    public Integer call() throws Exception {
        logger.info("Searching for movie: ", movieId);
        if (isAllMoviesRequested()) {
            displayAllMovies();
        } else {
            displayMovieById();
        }
        return 0;
    }
}







