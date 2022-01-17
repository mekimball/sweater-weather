class WeatherFacade
  def self.get_weather(lat, lon)
    weather = WeatherService.get_weather(lat, lon)
    current = CurrentWeather.new(weather[:current])

    daily = weather[:daily].mapp do |day|
      DailyWeather.new(day)
    end[0..4]
  end
end