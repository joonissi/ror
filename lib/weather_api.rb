class WeatherApi
  def self.weather_in(city)
    city = city.downcase
    get_weather_in(city)
  end

  def self.get_weather_in(city)
    url = "http://api.apixu.com/v1/current.xml?key=#{key}&q="

    response = HTTParty.get "#{url}#{ERB::Util.url_encode(city)}"
    weather = response.parsed_response["root"]["current"]

    return [] if weather.is_a?(Hash) and weather['temp_c'].nil?

    weather = [weather] if weather.is_a?(Hash)
    weather.map do | w |
      Weather.new(w)
    end
  end

  def self.key
    raise "WEATHER_APIKEY env variable not defined" if ENV['WEATHER_APIKEY'].nil?
    ENV['WEATHER_APIKEY']
  end
end
