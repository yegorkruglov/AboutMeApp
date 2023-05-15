//
//  Model.swift
//  AboutMeApp
//
//  Created by Egor Kruglov on 13.05.2023.
//

struct User {
    let username: String
    let password: String
    let person: Person
    
    
    static func getUser() -> User {
        User(username: "tim", password: "123", person: Person.getPerson())
        
    }
}

struct Person {
    let name: String
    let surname: String
    let company: String
    let occupation: String
    let imageName: String
    let bio: String
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        return Person(name: "Tim",
                      surname: "Cook",
                      company: "Apple",
                      occupation: "CEO",
                      imageName: "pngegg.png",
                      bio: "Tim Cook is the CEO of Apple and serves on its board of directors. Before being named CEO in August 2011, Tim was Apple’s chief operating officer and was responsible for all of the company’s worldwide sales and operations, including end-to-end management of Apple’s supply chain, sales activities, and service and support in all markets and countries. He also headed Apple’s Macintosh division and played a key role in the continued development of strategic reseller and supplier relationships, ensuring flexibility in response to an increasingly demanding marketplace. Prior to joining Apple, Tim was vice president of Corporate Materials for Compaq and was responsible for procuring and managing all of Compaq’s product inventory. Previous to his work at Compaq, Tim was the chief operating officer of the Reseller Division at Intelligent Electronics. Tim also spent 12 years with IBM, most recently as director of North American Fulfillment where he led manufacturing and distribution functions for IBM’s Personal Computer Company in North and Latin America. Tim earned an MBA from Duke University, where he was a Fuqua Scholar, and a Bachelor of Science degree in Industrial Engineering from Auburn University.")
    }
    
    
}
