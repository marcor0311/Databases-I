package tec.bd.cli.ReviewsCommand;

import picocli.CommandLine.Parameters;
import tec.bd.ApplicationContext;
import java.util.concurrent.Callable;
import tec.bd.entity.ReviewEntity;
import picocli.CommandLine;

@CommandLine.Command(name = "revr", description = "Find review")
public class GetReviewCommand implements Callable<Integer> {

    private static ApplicationContext applicationContext = ApplicationContext.init();

    @Parameters(paramLabel = "<id>", defaultValue = "0", description = "id of review")
    private int reviewID;

    @Override
    public Integer call() throws Exception {
        try {
            if (reviewID == 0) {
                var reviews = applicationContext.ReviewService.getReviews();
                if (reviews.isEmpty()) {
                    System.out.println("There are no reviews");
                    return 0;
                }
                for (ReviewEntity review : reviews) {
                    applicationContext.ReviewService.printReview(review);
                }
                return 0;
            }
            var review = applicationContext.ReviewService.getReviewById(reviewID);
            if (review.isEmpty()) {
                System.out.println("Review does not exist");
                return -1;
            }
            applicationContext.ReviewService.printReview(review.get());
            return 0;
        } catch (Exception e) {
            System.out.println("An error occurred: " + e.getMessage());
            e.printStackTrace();
            return -1;
        }
    }
}
