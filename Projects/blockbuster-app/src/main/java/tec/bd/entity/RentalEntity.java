package tec.bd.entity;

import java.util.Date;

public class RentalEntity {
    private int ID;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public Date getRentalDate() {
        return rentalDate;
    }

    public void setRentalDate(Date rentalDate) {
        this.rentalDate = rentalDate;
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

    public RentalEntity(int ID, Date rentalDate, int clientID, int movieID) {
        this.ID = ID;
        this.rentalDate = rentalDate;
        this.clientID = clientID;
        this.movieID = movieID;
    }
    public RentalEntity( Date rentalDate, int clientID, int movieID) {
        
        this.rentalDate = rentalDate;
        this.clientID = clientID;
        this.movieID = movieID;
    }
    public RentalEntity(  int clientID, int movieID) {
        
        
        this.clientID = clientID;
        this.movieID = movieID;
    }
    public RentalEntity( ) {
        
       
    }
    private Date rentalDate;
    private int clientID;
    private int movieID;
    
}
