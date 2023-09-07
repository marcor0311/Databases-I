package tec.bd.cli.ReviewsCommand;
import java.math.BigDecimal;
import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;
import tec.bd.ApplicationContext;
import java.util.Date;
import java.util.concurrent.Callable;
import tec.bd.entity.ReviewEntity;
@Command(name = "revu", description="Update review")
public class UpdateReviewCommand implements Callable<Integer>{
    private static ApplicationContext applicationContext = ApplicationContext.init();
    @Parameters(paramLabel = "<id>", description ="id of review")
    private int reviewID;
    @Parameters(paramLabel = "<movieID>", description ="id of movie")
    private int movieId;
    @Parameters(paramLabel = "<clientID>", description ="id of client")
    private int clientId;   
    @Parameters(paramLabel = "<rating>", description ="Rating of review. 0 to 5")
    private BigDecimal rating ;
    @Parameters(paramLabel = "<ReviewText>", description ="Text of review")
    private String reviewText;
    @Parameters(paramLabel = "<reviewDate>", description ="Date of review")
    private Date reviewDate;
    @Override
    public Integer call() throws Exception {
        var ReviewEntity = new ReviewEntity(this.reviewID,this.rating,this.reviewText,this.reviewDate,this.clientId,this.movieId);
        try{
           applicationContext.ReviewService.updateReview(ReviewEntity);
           System.out.println("The review has been updated");
           return 0;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return -1;
        }    
    }  
}