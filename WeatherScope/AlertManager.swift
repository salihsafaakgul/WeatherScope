import Foundation
import SwiftUI

class AlertManager:ObservableObject {
    @Published var alertTitle = "Location Permission Error"
    @Published var alertMessage = ""
    @Published var showAlert = false
    
    func createAlert(title:String, message:String, showAlert:Bool){
        alertTitle = title
        alertMessage = message
        self.showAlert = showAlert
    }
}
