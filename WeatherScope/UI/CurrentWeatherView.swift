import SwiftUI

struct CurrentWeatherView: View {
    
    @State var currentWeather:WeatherResponse?
    
    let weatherImages = ["rain":"cloud.drizzle", "cloud":"cloud.fill"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Current Weather Display
                    VStack {
                        // weather Image
                        Image(systemName: weatherImages["clear"] ?? "cloud.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .foregroundStyle(.white)
                        // degree
                        Text("\(Int(currentWeather?.main.temp ?? 0))°C").font(.system(size: 60).bold()).foregroundStyle(.white)
                            .font(.title).padding(10)
                        //City
                        Text(currentWeather?.name ?? "London").font(.system(size: 35).bold()).foregroundStyle(.white)
                            .font(.title)
                    }.padding()
                    
                    HStack(spacing:0) {
                        VStack(spacing: 10) {
                            Text("Feels Like")
                                .foregroundStyle(.white)
                                .font(.system(size: 20).bold())
                            Text("\(Int(currentWeather?.main.feels_like ?? 0))°C")
                                .foregroundStyle(.white)
                                .font(.system(size: 20))
                        }
                        Spacer()
                        VStack(spacing: 10) {
                            Text("Humidity")
                                .foregroundStyle(.white)
                                .font(.system(size: 20).bold())
                            Text("\(Int(currentWeather?.main.humidity ?? 0))%")
                                .foregroundStyle(.white)
                                .font(.system(size: 20))
                        }
                        Spacer()
                        VStack(spacing: 10) {
                            Text("Wind")
                                .foregroundStyle(.white)
                                .font(.system(size: 20).bold())
                            Text("\(Int(currentWeather?.wind.speed ?? 0))")
                                .foregroundStyle(.white)
                                .font(.system(size: 20))
                        }
   
                    }.padding(15).overlay(RoundedRectangle(cornerRadius: 20).stroke(.white, lineWidth: 2))
                    
                }.padding().frame(width: 370, height: 470)
            }.ignoresSafeArea()
        }
    }
}

/* #Preview {
    CurrentWeatherView(currentWeather: <#T##WeatherResponse?#>)
}
*/
