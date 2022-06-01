import Foundation

class User{
    
    let id: Int
    let nickname: String
    let motivation_tag: String
    let motivation_specification: String
    let interesets_tags: String
    let time_intervals: String
    let telegram_notifications: Int
    let phone_notifications: Int
    let time_inactive: Int
    
    init(id: Int, nickname: String, motivation_tag: String, motivation_specification: String, interesets_tags: String, time_intervals: String, telegram_notifications: Int, phone_notifications: Int, time_inactive: Int) {
        
        self.id = id
        self.nickname = nickname
        self.motivation_tag = motivation_tag
        self.motivation_specification = motivation_specification
        self.interesets_tags = interesets_tags
        self.time_intervals = time_intervals
        self.telegram_notifications = telegram_notifications
        self.phone_notifications = phone_notifications
        self.time_inactive = time_inactive

    }
}
