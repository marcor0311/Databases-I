package tec.bd.service;
import java.util.List;
import java.util.Optional;
import tec.bd.entity.RentalEntity;
public interface RentalService {
    List<RentalEntity> getRentals();
    Optional<RentalEntity> getRentalById(int rentalId);
    RentalEntity newRental(RentalEntity newRental);
    void removeRental(int rentalId);
    RentalEntity updateRentals(RentalEntity rental);
    void printRental (RentalEntity rental);
}