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
    
    func requestAuth(){
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings {settings in
            switch settings.authorizationStatus {
            case .authorized:
                self.scheduleNotification()
            case .denied:
                return
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]){ didAllow, error in
                    if didAllow {
                        self.scheduleNotification()
                    }
                }
            default:
                return
            }
        }
    }
    
    func scheduleNotification(){
        print("Notification scheduled!")
        let content = UNMutableNotificationContent()
        content.title = "Want to check up on yourself?"
        content.body = "Open Eden to log your mood!"
        content.sound = .default
        let ident = "night-notif"
        
        let calendar = Calendar.current
        var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        dateComponents.hour = 21
        dateComponents.minute = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: ident,
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [ident])
        UNUserNotificationCenter.current().add(request)
    }
}
