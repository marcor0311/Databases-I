package tec.bd.cli;

import picocli.CommandLine;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;
import tec.bd.ApplicationContext;
import tec.bd.weather.WeatherReport;
import tec.bd.weather.service.OpenWeatherResource;
import tec.bd.weather.service.OpenWeatherService;
import tec.bd.weather.service.WeatherService;

@CommandLine.Command(name = "imn-city", description = "Get weather forecast by zip code")
public class IMNCityCommand implements Runnable {

    private static ApplicationContext APP_CONTEXT = ApplicationContext.init();

    @CommandLine.Parameters(paramLabel = "<city>", description = "zip code to be resolved")
    private String city;

    @Override
    public void run() {
        var openWeatherService = APP_CONTEXT.IMNProviderSystem;
        var weatherReport = new WeatherReport(openWeatherService);
        var report = weatherReport.getByCity(city);
        System.out.println(report.getTemperature());
        System.out.println(report.getPressure());
        System.out.println(report.getHumidity());
        System.out.println(report.getTempMax());
        System.out.println(report.getTempMin());       
    }

}
