package tec.bd.service;
import java.util.List;
import static java.util.Objects.requireNonNull;
import tec.bd.entity.DataBaseLog;
import tec.bd.repository.DatabaseLogRepository;
public class DatabaseLogServiceImplementation implements DatabaseLogService{
    private final DatabaseLogRepository logRepository;
    public DatabaseLogServiceImplementation(DatabaseLogRepository logRepository , DatabaseStoredProcedure featureFlags){
        requireNonNull(logRepository);
        requireNonNull(featureFlags);
        this.logRepository = logRepository;
    }
    @Override
    public List<DataBaseLog> getLogs() {
        return this.logRepository.findAll();
    }
    @Override
    public List<DataBaseLog> getTheLogs(int n) {
        return this.logRepository.findLastN(n);
    }
    @Override
    public void printLog(DataBaseLog log) {
        System.out.println("╔════════════════════════════════════════╗");
        System.out.println("║               Log Details               ");
        System.out.println("|───────────────┬─────────────────────────");
        System.out.printf("║   Log ID      │ %s\n", log.getId());
        System.out.println("|───────────────┼─────────────────────────");
        System.out.printf("║   TableName   │ %s\n", log.getTableName());
        System.out.println("|───────────────┼─────────────────────────");
        System.out.printf("║   Created on  │ %s\n", log.getCreatedOn());
        System.out.println("|───────────────┼─────────────────────────");
        System.out.printf("║   Entry text  │ %s\n", log.getEntryText());
        System.out.println("╚════════════════════════════════════════╝");
    }

}
