package tec.bd.cli.MoviesCommand;
import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;
import tec.bd.ApplicationContext;
import java.util.concurrent.Callable;

@Command(name = "movd", description = "Delete movie")
public class DeleteMovieCommand implements Callable<Integer> {
    private static ApplicationContext applicationContext = ApplicationContext.init();
    @Parameters(paramLabel = "<id>", description = "ID of the movie")
    private int movieID;
    /**
     * Executes the delete movie command.
     *
     * @return 0 for success, -1 for failure
     * @throws Exception if an error occurs during execution
     */
    @Override
    public Integer call() throws Exception {
        try {
            // Call the removeMovie() method of the movieService to delete the movie
            applicationContext.movieService.removeMovie(movieID);
            return 0; // Return 0 for success
        } catch (Exception e) {
            System.out.println("Something went wrong");
            return -1; // Return -1 for failure
        }
    }
}

