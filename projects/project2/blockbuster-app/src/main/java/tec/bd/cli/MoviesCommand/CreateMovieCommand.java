package tec.bd.cli.MoviesCommand;

import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;
import tec.bd.ApplicationContext;
import tec.bd.entity.MovieEntity;
import java.util.Date;
import java.util.concurrent.Callable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Command(name = "movc", description = "Create new movie")
public class CreateMovieCommand implements Callable<Integer> {
    private final static Logger LOGGER = LoggerFactory.getLogger(CreateMovieCommand.class);
    private static ApplicationContext applicationContext = ApplicationContext.init();
    @Parameters(paramLabel = "<title>", description = "Title of movie")
    private String movieTitle;
    @Parameters(paramLabel = "<release_date>", description = "Release date of movie")
    private Date releaseDate;
    @Parameters(paramLabel = "<categoryID>", description = "id of category")
    private int categoryID;
    @Parameters(paramLabel = "<units_available>", description = "Units available")
    private int unitsAvailable;
    /**
     * Executes the create movie command.
     *
     * @return 0 for success, -1 for failure
     * @throws Exception if an error occurs during execution
     */
    @Override
    public Integer call() throws Exception {
        // Create a new MovieEntity object with the provided parameters
        MovieEntity movieEntity = new MovieEntity(movieTitle, releaseDate, categoryID, unitsAvailable);
        try {
            // Call the newMovie() method of the movieService to create the movie
            applicationContext.movieService.newMovie(movieEntity);
            System.out.println("Now there is a new movie");
            return 0; // Return 0 for success
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return -1; // Return -1 for failure
        }
    }
}


