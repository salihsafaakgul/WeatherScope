import SwiftUI

struct ContentView: View {
    
    @ObservedObject var locationManager = LocationManager()
    @ObservedObject var alertManager = AlertManager()
    @State var currentWeather:WeatherResponse?
    
    var body: some View {
        NavigationView {
            if currentWeather != nil {
                CurrentWeatherView(currentWeather: currentWeather)
            }
            else {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    
                    ProgressView().task {
                        let coordinates = locationManager.locationCoordinates
                        let apiCalls = APICalls(latitude: coordinates.latitude , longitude: coordinates.longitude)
                        
                        do {
                            let data = try await apiCalls.fetchCurrentWeather()
                            currentWeather = data }
                        catch {
                            print("error:\(error)")
                        }
                    }
                }
            }
        }.navigationTitle("WeatherScope")
    }
}
#Preview {
    ContentView()
}
