package tec.bd.entity;

import java.math.BigDecimal;
import java.util.Date;

public class ReviewEntity {
    private int ID;
    private BigDecimal rating;
    private String reviewText;
    private Date createdOn;
    private int clientID;
    private int movieID;

    public ReviewEntity(int ID, BigDecimal rating, String reviewText, Date createdOn, int clientID, int movieID) {
        this.ID = ID;
        this.rating = rating;
        this.reviewText = reviewText;
        this.createdOn = createdOn;
        this.clientID = clientID;
        this.movieID = movieID;
    }
    public ReviewEntity( BigDecimal rating, String reviewText, Date createdOn, int clientID, int movieID) {
        
        this.rating = rating;
        this.reviewText = reviewText;
        this.createdOn = createdOn;
        this.clientID = clientID;
        this.movieID = movieID;
    }
    public ReviewEntity(){
        
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public BigDecimal getRating() {
        return rating;
    }

    public void setRating(BigDecimal rating) {
        this.rating = rating;
    }

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }

    public int getClientID() {
        return clientID;
    }

    public void setClientID(int clientID) {
        this.clientID = clientID;
    }

    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }
    
}
