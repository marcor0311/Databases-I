package tec.bd.cli.ReviewsCommand;
import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;
import tec.bd.ApplicationContext;
import java.util.concurrent.Callable;
@Command(name = "revd", description="Delete review")
public class DeleteReviewCommand implements Callable<Integer>{
    private static ApplicationContext applicationContext = ApplicationContext.init(); 
    @Parameters(paramLabel = "<id>", description ="id of review")
    private int reviewID;
    @Override
    public Integer call() throws Exception {
        try{
           applicationContext.ReviewService.removeReview(reviewID);
           return 0;
        }catch(Exception e){
            System.out.println("Something went wrong");
            return -1;
        }      
    }   
}
