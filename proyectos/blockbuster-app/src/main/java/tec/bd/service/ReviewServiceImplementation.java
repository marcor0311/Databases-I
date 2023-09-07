package tec.bd.service;
import java.util.List;
import java.util.Optional;
import static java.util.Objects.requireNonNull;
import tec.bd.entity.ReviewEntity;
import tec.bd.repository.ReviewRepository;
public class ReviewServiceImplementation implements ReviewService {
    private final ReviewRepository ReviewRepository;
    public ReviewServiceImplementation(ReviewRepository ReviewRepository , DatabaseStoredProcedure featureFlags){
        requireNonNull(ReviewRepository);
        requireNonNull(featureFlags);
        this.ReviewRepository = ReviewRepository;
    }
    @Override
    public List<ReviewEntity> getReviews() {
        return this.ReviewRepository.findAll();
    }
    @Override
    public Optional<ReviewEntity> getReviewById(int reviewId) {
         return this.ReviewRepository.findById(reviewId);  
    }
    @Override
    public ReviewEntity newReview(ReviewEntity review) {
        requireNonNull(review);
        System.out.println("New review, loading...");
        var newReviewID = this.ReviewRepository.save(review);
        System.out.println("New review, id is: "+newReviewID);
        review.setID(newReviewID);
        return review;
    }
    @Override
    public void removeReview(int reviewId) {
        requireNonNull(reviewId);
        System.out.println("removed review");
        this.ReviewRepository.delete(reviewId);
    }
    @Override
    public ReviewEntity updateReview(ReviewEntity review) {
        requireNonNull(review);
        this.ReviewRepository.update(review);
        return review;
    }
    public void printReview(ReviewEntity review) {
        System.out.println("╔════════════════════════════════════════╗");
        System.out.println("║              Review Details            ║");
        System.out.println("|───────────────┬─────────────────────────");
        System.out.printf("║   Review ID   │ %d\n", review.getID());
        System.out.println("|───────────────┼─────────────────────────");
        System.out.printf("║   Review Date │ %s\n", review.getCreatedOn());
        System.out.println("|───────────────┼─────────────────────────");
        System.out.printf("║   Client ID   │ %d\n", review.getClientID());
        System.out.println("|───────────────┼─────────────────────────");
        System.out.printf("║   Movie ID    │ %d\n", review.getMovieID());
        System.out.println("|───────────────┼─────────────────────────");
        System.out.printf("║   Review Text │ %s\n", review.getReviewText());
        System.out.println("|───────────────┼─────────────────────────");
        System.out.printf("║   Rating      │ %.2f\n", review.getRating());
        System.out.println("╚════════════════════════════════════════╝");
    }

}