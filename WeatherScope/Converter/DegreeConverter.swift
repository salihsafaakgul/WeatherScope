import Foundation

func FahrenheitToCelsius(Fahrenheit:Double) -> Double {
    let TempInput = Measurement(value: Fahrenheit, unit: UnitTemperature.fahrenheit)
    let TempOutput = TempInput.converted(to: UnitTemperature.celsius)
    var result = TempOutput.value
    
    return result
}
