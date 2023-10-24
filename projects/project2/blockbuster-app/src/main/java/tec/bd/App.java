package tec.bd;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import picocli.CommandLine;
import tec.bd.cli.MainCommand;
public class App {
    private final static Logger LOGGER = LoggerFactory.getLogger(App.class);
    public static void main(String[] args) {
        configureLogging();
        LOGGER.debug("Movie Catalog App: initializing...");
        CommandLine cmd = new CommandLine(new MainCommand());
        cmd.setExecutionStrategy(new CommandLine.RunAll());
        cmd.execute(args);
    }
    private static void configureLogging() {
        ch.qos.logback.classic.Logger rootLogger = (ch.qos.logback.classic.Logger) LoggerFactory.getLogger(Logger.ROOT_LOGGER_NAME);
        rootLogger.setLevel(ch.qos.logback.classic.Level.ERROR);
    }
}