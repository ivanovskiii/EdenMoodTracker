//
//  LocalNotificationHandler.swift
//  EdenMoodTracker
//
//  Created by Gorjan Ivanovski on 6.2.23.
//

import SwiftUI
import UserNotifications

class NotificationHandler{
    static let instance = NotificationHandler()
    
    func requestAuth() {
        
        let options: UNAuthorizationOptions = [.alert, .sound]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error{
                print("Error: \(error)")
            } else{
                print("Success!")
            }
        }
    }
    
    func scheduleNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Want to check up on yourself?"
        content.subtitle = "Open Eden to log your mood!"
        content.sound = .default
        
        let calendar = Calendar.current
        var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        dateComponents.hour = 21
        dateComponents.minute = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
