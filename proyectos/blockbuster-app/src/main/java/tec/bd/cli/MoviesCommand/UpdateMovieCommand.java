package tec.bd.cli.MoviesCommand;

import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;
import tec.bd.ApplicationContext;
import java.util.concurrent.Callable;
import java.util.Date;
import tec.bd.entity.MovieEntity;

@Command(name = "movu", description = "Update movie")
public class UpdateMovieCommand implements Callable<Integer> {
    private static ApplicationContext applicationContext = ApplicationContext.init();
    @Parameters(paramLabel = "<id>", description = "id of movie")
    private int movieID;
    @Parameters(paramLabel = "<title>", description = "Title of movie")
    private String movieTitle;
    @Parameters(paramLabel = "<release_date>", description = "Release date of movie")
    private Date releaseDate;
    @Parameters(paramLabel = "<categoryID>", description = "ID of category")
    private int categoryID;
    @Parameters(paramLabel = "<units_available>", description = "Units available to rent")
    private int unitsAvailable;
    /**
     * Executes the update movie command.
     *
     * @return 0 for success, -1 for failure
     * @throws Exception if an error occurs during execution
     */
    @Override
    public Integer call() throws Exception {
        var movieEntity = new MovieEntity(movieID, movieTitle, releaseDate, categoryID, unitsAvailable);
        try {
            // Call the updateMovie() method of the movieService to update the movie
            applicationContext.movieService.updateMovie(movieEntity);
            System.out.println("The movie was updated successfully");
            return 0; // Return 0 for success
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return -1; // Return -1 for failure
        }
    }
}
