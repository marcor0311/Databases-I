package tec.bd.cli;
import tec.bd.cli.ClientsCommand.GetClientCommand;
import tec.bd.cli.ClientsCommand.UpdateClientCommand;
import tec.bd.cli.MoviesCommand.*;
import tec.bd.cli.RentalsCommand.*;
import tec.bd.cli.ReviewsCommand.*;
import picocli.CommandLine.Command;
import picocli.CommandLine.HelpCommand;
import tec.bd.ApplicationContext;
import tec.bd.cli.CategoriesCommand.*;
import tec.bd.cli.ClientsCommand.CreateClientCommand;
import tec.bd.cli.ClientsCommand.DeleteClientCommand;
@Command(
        name = "Movies App",
        subcommands = {
                CreateRentalCommand.class,
                DeleteRentalCommand.class,
                GetRentalCommand.class,
                UpdateRentalCommand.class,
                CreateReviewCommand.class,
                DeleteReviewCommand.class,
                GetReviewCommand.class,
                UpdateReviewCommand.class,
                LogDB.class,
                CreateMovieCommand.class,
                DeleteMovieCommand.class,
                GetMovieCommand.class,
                UpdateMovieCommand.class,
                CreateClientCommand.class,
                HelpCommand.class,
                GetClientCommand.class,
                DeleteClientCommand.class,
                UpdateClientCommand.class,
                CreateCategoryCommand.class,
                DeleteCategoryCommand.class,
                GetCategoryCommand.class,
                UpdateCategoryCommand.class,                                
        },
        description = "Movie Catalog")
public class MainCommand implements Runnable {
    @Override
    public void run() {
        ApplicationContext appContext = ApplicationContext.init();                
    }
}
