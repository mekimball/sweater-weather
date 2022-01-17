require 'rails_helper'

RSpec.describe WeatherService do

  it 'can establish a connection', :vcr do
    expect(WeatherService.conn).to be_a(Faraday::Connection)
  end

  it 'can return current weather data', :vcr do
    results = WeatherService.get_weather('39.7385', '-104.9849')
    results_parsed = results[:current]

    expect(results_parsed).to be_a(Hash)
    expect(results_parsed).to have_key(:dt)
    expect(results_parsed).to have_key(:sunrise)
    expect(results_parsed).to have_key(:sunset)
    expect(results_parsed).to have_key(:temp)
    expect(results_parsed).to have_key(:feels_like)
    expect(results_parsed).to have_key(:humidity)
    expect(results_parsed).to have_key(:uvi)
    expect(results_parsed).to have_key(:visibility)
    expect(results_parsed[:weather].first).to have_key(:description)
    expect(results_parsed[:weather].first).to have_key(:icon)
  end
end