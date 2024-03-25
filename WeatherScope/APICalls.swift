import Foundation

struct APICalls {
    let buildURL = BuildURL()
    var latitude:Double
    var longitude:Double
    func fetchCurrentWeather() async throws -> WeatherResponse? {
        do {
            let buildedURL = buildURL.URLQuery(latitude: latitude, longitude: longitude)
            print(buildedURL)
            
            guard let url = buildedURL else {
                fatalError("Missing URL")
            }
            
            let request = URLRequest(url: url)
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching current weather") }
            
            let weather = decodeCurrentWeather(data: data)
            print("\(weather)")
            return weather
        }
        
        catch {
            print(error)
            return nil
        }
    }
    
    func decodeCurrentWeather(data:Data?) -> WeatherResponse? {
        let decoder = JSONDecoder()

        let decodedata = try? decoder.decode(WeatherResponse.self, from: data!)
        return decodedata
    }
}
