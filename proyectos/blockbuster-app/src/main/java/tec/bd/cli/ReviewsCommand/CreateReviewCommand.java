package tec.bd.cli.ReviewsCommand;
import java.math.BigDecimal;
import java.math.RoundingMode;
import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;
import tec.bd.ApplicationContext;
import java.util.Date;
import java.util.concurrent.Callable;
import tec.bd.entity.ReviewEntity;
@Command(name = "revc", description="Create new review")
public class CreateReviewCommand implements Callable<Integer>{
    private static ApplicationContext applicationContext = ApplicationContext.init();
    @Parameters(paramLabel = "<movieID>", description ="id of movie")
    private int movieId ;
    @Parameters(paramLabel = "<clientID>", description ="id of client")
    private int clientId ;
    @Parameters(paramLabel = "<rating>", description ="Rating of review. 0 to 5")
    private BigDecimal rating ;
    @Parameters(paramLabel = "<ReviewText>", description ="Text review")
    private String reviewText;
    @Parameters(paramLabel = "<reviewDate>", description ="Date of review")
    private Date reviewDate;
    public static boolean isBetween(BigDecimal value, BigDecimal min, BigDecimal max) {
        return value.compareTo(min) >= 0 && value.compareTo(max) <= 0;
    }
    @Override
    public Integer call() throws Exception {
        this.rating = this.rating.setScale(2,RoundingMode.HALF_UP);
        boolean range = isBetween(rating,new BigDecimal("0"),new BigDecimal("5"));
        if  (!range){       
            System.out.println("Remember the range is between 0-5");
        }
        var ReviewEntity = new ReviewEntity(this.rating,this.reviewText,this.reviewDate,this.clientId,this.movieId);
        try{
           applicationContext.ReviewService.newReview(ReviewEntity);
           System.out.println("Now there is a new review");
           return 0;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return -1;
        }    
    }    
}
