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
    
    static func getPerson() -> Person {
        return Person(name: "Tim", surname: "Cook", company: "Apple", occupation: "CEO")
    }
}

struct Person {
    let name: String
    let surname: String
    let company: String
    let occupation: String
}
