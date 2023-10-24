package tec.bd.weather.service;

import tec.bd.weather.Report;

public class IMNProvider implements WeatherService{

    @Override
    public Report byZipCode(int zipCode) {
        return new Report();
    }

    @Override
    public Report byCity(String city) {
        return new Report();
    }
    
}
