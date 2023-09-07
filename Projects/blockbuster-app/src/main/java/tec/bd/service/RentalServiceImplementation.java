package tec.bd.service;

import java.util.List;
import java.util.Optional;
import static java.util.Objects.requireNonNull;
import tec.bd.entity.RentalEntity;
import tec.bd.repository.RentalRepository;
public class RentalServiceImplementation implements RentalService {  
    private final RentalRepository RentalRepository;
    public RentalServiceImplementation(RentalRepository RentalRepository , DatabaseStoredProcedure featureFlags){
        requireNonNull(RentalRepository);
        requireNonNull(featureFlags);
        this.RentalRepository = RentalRepository; 
    }
    @Override
    public List<RentalEntity> getRentals() {
        return this.RentalRepository.findAll();
    }
    @Override
    public Optional<RentalEntity> getRentalById(int rentalId) {
        return this.RentalRepository.findById(rentalId);
    }
    @Override
    public RentalEntity newRental(RentalEntity rental) {
        requireNonNull(rental);
        System.out.println("New rental, loading...");
        var newRentalID = this.RentalRepository.save(rental);
        System.out.println("New rental, id is: "+newRentalID);
        rental.setID(newRentalID);
        return rental;
    }
    @Override
    public void removeRental(int rentalId) {
        requireNonNull(rentalId);
        System.out.println("removed rental");
        this.RentalRepository.delete(rentalId);
    }
    @Override
    public RentalEntity updateRentals(RentalEntity rental) {
        requireNonNull(rental);
        this.RentalRepository.update(rental);
        return rental;
    }
    @Override
    public void printRental(RentalEntity rental) {
        System.out.println("╔════════════════════════════════════════╗");
        System.out.println("║             Rental Details               ");
        System.out.println("|─────────────────────────────────────────");
        System.out.printf("║   ID           │ %d\n", rental.getID());
        System.out.println("|─────────────────────────────────────────");
        System.out.printf("║   Date         │ %s\n", rental.getRentalDate());
        System.out.println("|─────────────────────────────────────────");
        System.out.printf("║   Client ID    │ %d\n", rental.getClientID());
        System.out.println("|─────────────────────────────────────────");
        System.out.printf("║   Movie ID     │ %d\n", rental.getMovieID());
        System.out.println("╚════════════════════════════════════════╝");
    }
}
