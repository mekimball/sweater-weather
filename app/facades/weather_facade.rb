class WeatherFacade
  def self.get_weather(lat, lon)
    weather = WeatherService.get_weather(lat, lon)
    current = CurrentWeather.new(weather[:current])

    daily = weather[:daily].map do |day|
      DailyWeather.new(day)
    end[0..4]

    all_weather = {}
    all_weather[:current_weather] = current
    all_weather[:daily_weather] = daily
    all_weather
  end
end