import Foundation

struct BuildURL {
    
    func URLQuery(latitude:Double, longitude:Double) -> URL? {
        var urlComponent = URLComponents()
        urlComponent.scheme = Constants.scheme
        urlComponent.host = Constants.host
        urlComponent.path = Constants.path
        urlComponent.queryItems = [URLQueryItem(name: "lat", value: String(latitude)), URLQueryItem(name: "lon", value: String(longitude)), URLQueryItem(name: "appid", value: Constants.APIkey), URLQueryItem(name: "units", value: "metric")]
        return urlComponent.url
    }
    
}
