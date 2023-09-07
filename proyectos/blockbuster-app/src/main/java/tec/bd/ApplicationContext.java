package tec.bd;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import tec.bd.repository.CategoryRepository;
import tec.bd.repository.CategoryRepoImpementationl;
import tec.bd.repository.DatabaseLogRepository;
import tec.bd.repository.DatabaseLogRepoImplementation;
import tec.bd.service.DatabaseStoredProcedure;
import tec.bd.repository.MovieRepository;
import tec.bd.repository.MovieRepoImplementation;
import tec.bd.repository.ClientRepository;
import tec.bd.repository.ClientRepoImplementation;
import tec.bd.repository.RentalRepository;
import tec.bd.repository.RentalRepoImplementation;
import tec.bd.repository.ReviewRepository;
import tec.bd.repository.ReviewRepoImplementation;
import tec.bd.service.MovieService;
import tec.bd.service.MovieServiceImplementation;
import tec.bd.service.CategoryService;
import tec.bd.service.CategoryServiceImplementation;
import tec.bd.service.ClientService;
import tec.bd.service.ClientServiceImplementation;
import tec.bd.service.DatabaseLogService;
import tec.bd.service.DatabaseLogServiceImplementation;
import tec.bd.service.RentalService;
import tec.bd.service.RentalServiceImplementation;
import tec.bd.service.ReviewService;
import tec.bd.service.ReviewServiceImplementation;

public class ApplicationContext {

    public DatabaseStoredProcedure featureFlags;
    public ClientRepository clientRepository;
    public ClientService clientService;
    public CategoryRepository categoryRepository;
    public CategoryService CategoryService;
    public RentalRepository RentalRepository;
    public RentalService RentalService;
    public ReviewRepository ReviewRepository;
    public ReviewService ReviewService;
    public DatabaseLogRepository logRepository;
    public DatabaseLogService LogService;
    public MovieRepository movieRepository;
    public MovieService movieService;

    private ApplicationContext() {}

    public static ApplicationContext init() {
        ApplicationContext appContext = new ApplicationContext();
        var hikariConfig = initHikariDataSource();

        appContext.featureFlags = new DatabaseStoredProcedure();
        appContext.clientRepository = initClientRepository(hikariConfig);
        appContext.clientService = initClientService(appContext.clientRepository, appContext.featureFlags);
        appContext.categoryRepository = initCategoryRepository(hikariConfig);
        appContext.CategoryService = initCategoryService(appContext.categoryRepository, appContext.featureFlags);
        appContext.RentalRepository = initRentalRepository(hikariConfig);
        appContext.RentalService = initRentalService(appContext.RentalRepository, appContext.featureFlags);
        appContext.ReviewRepository = initReviewRepository(hikariConfig);
        appContext.ReviewService = initReviewService(appContext.ReviewRepository, appContext.featureFlags);
        appContext.logRepository = initLogRepository(hikariConfig);
        appContext.LogService = initLogService(appContext.logRepository, appContext.featureFlags);
        appContext.movieRepository = initMovieRepository(hikariConfig);
        appContext.movieService = initMovieService(appContext.movieRepository, appContext.featureFlags);

        return appContext;
    }

    private static HikariDataSource initHikariDataSource() {
        HikariConfig hikariConfig = new HikariConfig();
        var jdbcUrl = "jdbc:mysql://localhost:3306/blockbuster?serverTimezone=UTC";
        var username = "blockbusterappuser";
        var password = "blockbusterapppass";
//var jdbcUrl = System.getenv("MOVIES_DB_JDBC");//jdbc:mysql://localhost:3306/blockbuster
//var username = System.getenv("MOVIES_DB_USERNAME");//root
//var password = System.getenv("MOVIES_DB_PASSWORD");//rootroot
//var jdbcUrl = System.getenv("MOVIES_DB_JDBC");
//var username = System.getenv("blockbusterappuser");
//var password = System.getenv("blockbusterapppass");
        hikariConfig.setJdbcUrl(jdbcUrl);
        hikariConfig.setUsername(username);
        hikariConfig.setPassword(password);
        hikariConfig.setConnectionTestQuery("SELECT 1");
        hikariConfig.setRegisterMbeans(false);
        hikariConfig.setLeakDetectionThreshold(0);
        hikariConfig.setMinimumIdle(10);
        hikariConfig.setMaximumPoolSize(10);
        hikariConfig.addDataSourceProperty("cachePrepStmts", "true");
        hikariConfig.addDataSourceProperty("prepStmtCacheSize", "250");
        hikariConfig.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
        HikariDataSource dataSource = new HikariDataSource(hikariConfig);
        dataSource.setMetricRegistry(null);
        return dataSource;
    }

    private static ClientRepository initClientRepository(HikariDataSource hikariDataSource) {
        return new ClientRepoImplementation(hikariDataSource);
    }

    private static ClientService initClientService(ClientRepository ClientRepository,
                                                   DatabaseStoredProcedure featureFlags) {
        return new ClientServiceImplementation(ClientRepository, featureFlags);
    }

    private static CategoryRepository initCategoryRepository(HikariDataSource hikariDataSource) {
        return new CategoryRepoImpementationl(hikariDataSource);
    }

    private static CategoryService initCategoryService(CategoryRepository categoryRepository,
                                                       DatabaseStoredProcedure featureFlags) {
        return new CategoryServiceImplementation(categoryRepository, featureFlags);
    }

    private static RentalRepository initRentalRepository(HikariDataSource hikariDataSource) {
        return new RentalRepoImplementation(hikariDataSource);
    }

    private static RentalService initRentalService(RentalRepository RentalRepository,
                                                   DatabaseStoredProcedure featureFlags) {
        return new RentalServiceImplementation(RentalRepository, featureFlags);
    }

    private static ReviewRepository initReviewRepository(HikariDataSource hikariDataSource) {
        return new ReviewRepoImplementation(hikariDataSource);
    }

    private static ReviewService initReviewService(ReviewRepository ReviewRepository,
                                                   DatabaseStoredProcedure featureFlags) {
        return new ReviewServiceImplementation(ReviewRepository, featureFlags);
    }

    private static DatabaseLogRepository initLogRepository(HikariDataSource hikariDataSource) {
        return new DatabaseLogRepoImplementation(hikariDataSource);
    }

    private static DatabaseLogService initLogService(DatabaseLogRepository logRepository,
                                                     DatabaseStoredProcedure featureFlags) {
        return new DatabaseLogServiceImplementation(logRepository, featureFlags);
    }

    private static MovieRepository initMovieRepository(HikariDataSource hikariDataSource) {
        return new MovieRepoImplementation(hikariDataSource);
    }

    private static MovieService initMovieService(MovieRepository movieRepository,
                                                 DatabaseStoredProcedure featureFlags) {
        return new MovieServiceImplementation(movieRepository, featureFlags);
    }
}