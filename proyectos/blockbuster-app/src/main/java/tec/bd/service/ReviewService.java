package tec.bd.service;
import java.util.List;
import java.util.Optional;
import tec.bd.entity.ReviewEntity;
public interface ReviewService {
    List<ReviewEntity> getReviews();
    Optional<ReviewEntity> getReviewById(int reviewId);
    ReviewEntity newReview(ReviewEntity newReview);
    void removeReview(int reviewId);
    ReviewEntity updateReview(ReviewEntity review);
    void printReview (ReviewEntity review);
}