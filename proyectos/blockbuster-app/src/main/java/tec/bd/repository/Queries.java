package tec.bd.repository;

public class Queries {

    // Queries for Movies

    /**
     * SQL query to retrieve all movies.
     */
    public static final String MOVIES_FIND_ALL_QUERY =
            "SELECT id, title, release_date, category_id, units_available " +
            "FROM movie";

    /**
     * SQL query to retrieve a movie by its ID.
     */
    public static final String MOVIES_FIND_BY_ID_QUERY =
            "SELECT id, title, release_date, category_id, units_available " +
            "FROM movie WHERE id = ?";

    /**
     * SQL query to insert a new movie.
     */
    public static final String MOVIES_INSERT_QUERY =
            "INSERT INTO movie (title, release_date, category_id, units_available) " +
            "VALUES (?, ?, ?, ?)";

    /**
     * SQL query to delete a movie by its ID.
     */
    public static final String MOVIES_DELETE_MOVIE_ID =
            "DELETE FROM movie WHERE id = ?";

    /**
     * SQL query to update a movie.
     */
    public static final String MOVIES_UPDATE_MOVIE =
            "UPDATE movie SET title = ?, release_date = ?, category_id = ?, units_available = ? " +
            "WHERE id = ?";

    // Client queries

    /**
     * SQL query to retrieve all clients.
     */
    public static final String CLIENT_FIND_ALL_QUERY =
            "SELECT id, name, lastname, email, phone_number " +
            "FROM client";

    /**
     * SQL query to retrieve a client by their ID.
     */
    public static final String CLIENT_FIND_BY_ID_QUERY =
            "SELECT id, name, lastname, email, phone_number " +
            "FROM client WHERE id = ?";

    /**
     * SQL query to insert a new client.
     */
    public static final String CLIENT_INSERT_QUERY =
            "INSERT INTO client (name, lastname, email, phone_number) " +
            "VALUES (?, ?, ?, ?)";

    /**
     * Stored procedure call to create a new client.
     */
    public static final String CLIENT_CREATE_CLIENT_PROC_CALL =
            "CALL create_client(?, ?, ?, ?, ?)";

    /**
     * Stored procedure call to delete a client.
     */
    public static final String CLIENT_DELETE_CLIENT_PROC_CALL =
            "CALL delete_client(?, ?)";

    /**
     * Stored procedure call to update a client.
     */
    public static final String CLIENT_UPDATE_CLIENT_PROC_CALL =
            "CALL update_client(?, ?, ?, ?, ?, ?)";

    // Category queries

    /**
     * SQL query to retrieve all categories.
     */
    public static final String CATEGORY_FIND_ALL_QUERY =
            "SELECT id, name, description " +
            "FROM category";

    /**
     * SQL query to retrieve a category by its ID.
     */
    public static final String CATEGORY_FIND_BY_ID_QUERY =
            "SELECT id, name, description " +
            "FROM category WHERE id = ?";

    /**
     * Stored procedure call to create a new category.
     */
    public static final String CATEGORY_CREATE_CATEGORY_PROC_CALL =
            "CALL create_category(?, ?, ?)";

    /**
     * Stored procedure call to delete a category.
     */
    public static final String CATEGORY_DELETE_CATEGORY_PROC_CALL =
            "CALL delete_category(?, ?)";

    /**
     * Stored procedure call to update a category.
     */
    public static final String CATEGORY_UPDATE_CATEGORY_PROC_CALL =
            "CALL update_category(?, ?, ?, ?)";

    // Rental queries

    /**
     * SQL query to retrieve all rentals.
     */
    public static final String RENTAL_FIND_ALL_QUERY =
            "SELECT id, rental_date, client_id, movie_id " +
            "FROM rentals";

    /**
     * SQL query to retrieve a rental by its ID.
     */
    public static final String RENTAL_FIND_BY_ID_QUERY =
            "SELECT id, rental_date, client_id, movie_id " +
            "FROM rentals WHERE id = ?";

    /**
     * Stored procedure call to create a new rental.
     */
    public static final String RENTAL_CREATE_RENTAL_PROC_CALL =
            "CALL create_rental(?, ?, ?, ?)";

    /**
     * Stored procedure call to delete a rental.
     */
    public static final String RENTAL_DELETE_RENTAL_PROC_CALL =
            "CALL delete_rental(?, ?)";

    /**
     * Stored procedure call to update a rental.
     */
    public static final String RENTAL_UPDATE_RENTAL_PROC_CALL =
            "CALL update_category(?, ?, ?, ?, ?)";

    // Review queries

    /**
     * SQL query to retrieve all reviews.
     */
    public static final String REVIEW_FIND_ALL_QUERY =
            "SELECT id, movie_id, client_id, rating, review_text, created_on " +
            "FROM review";

    /**
     * SQL query to retrieve a review by its ID.
     */
    public static final String REVIEW_FIND_BY_ID_QUERY =
            "SELECT id, movie_id, client_id, rating, review_text, created_on " +
            "FROM review WHERE id = ?";

    /**
     * Stored procedure call to create a new review.
     */
    public static final String REVIEW_CREATE_REVIEW_PROC_CALL =
            "CALL create_review(?, ?, ?, ?, ?, ?)";

    /**
     * Stored procedure call to delete a review.
     */
    public static final String REVIEW_DELETE_REVIEW_PROC_CALL =
            "CALL delete_review(?, ?)";

    /**
     * Stored procedure call to update a review.
     */
    public static final String REVIEW_UPDATE_REVIEW_PROC_CALL =
            "CALL update_review(?, ?, ?, ?, ?, ?, ?)";

    /**
     * SQL query to retrieve all log entries from the blockbuster_log table.
     */
    public static final String FIND_ALL_FROM_LOG =
            "SELECT id, table_name, created_on, entry_text " +
            "FROM blockbuster_log ORDER BY created_on DESC";

    /**
     * SQL query to retrieve n number of log entries from the blockbuster_log table.
     */
    public static final String FIND_N_FROM_LOG =
            "SELECT id, table_name, created_on, entry_text " +
            "FROM blockbuster_log ORDER BY created_on DESC LIMIT ?";
}
