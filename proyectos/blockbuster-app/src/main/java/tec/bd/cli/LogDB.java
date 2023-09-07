package tec.bd.cli;
import picocli.CommandLine.Parameters;
import tec.bd.ApplicationContext;
import java.util.concurrent.Callable;
import picocli.CommandLine;
import tec.bd.entity.DataBaseLog;
@CommandLine.Command(name = "log", description="Find last n logs ")
public class LogDB implements Callable<Integer>{  
    private static ApplicationContext applicationContext = ApplicationContext.init();    
    @Parameters(paramLabel = "<N>", defaultValue = "0" ,description ="Find last n logs")
    private int n;
    @Override
    public Integer call() throws Exception {
        try{
            if(n <=0){
             var logs =applicationContext.LogService.getLogs();
          if (logs.isEmpty()){
            System.out.println("There are no logs that can be found right now");
            return 0;
        }
        for (DataBaseLog log: logs){
            applicationContext.LogService.printLog(log);
            System.out.println("\n"); 
          }
          return 0;
        }
        var logs =applicationContext.LogService.getTheLogs(n);
        if (logs.isEmpty()){
            System.out.println("There are no logs that can be found right now");
            return 0;
          }
          for (DataBaseLog log: logs){
            applicationContext.LogService.printLog(log);
        };
        return 0;
    }catch(Exception e){
        System.out.println("Something went wrong");
        return -1;
    }
}}