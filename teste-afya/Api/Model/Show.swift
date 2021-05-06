//
//  Show.swift
//  teste-afya
//
//  Created by Magna on 06/05/21.
//

import Foundation

struct Show: Codable {
    let id: Int?
    let url: String?
    let name: String?
    let type: String?
    let language: String?
    let genres: [String]?
    let status: String?
    let runtime: Int?
    let averageRuntime: Int?
    let premiered: String?
    let officialSite: String?
    let schedule: ScheduleSub?
    let rating: Rating?
    let weight: Int
    let network: Network?
//    let webChannel: String?
//    let dvdCountry: String?
    let externals: Externals?
    let image: Image?
    let summary: String?
    let updated: Int?
    let _links:  Links?

}

struct Links: Codable {
    
    let link: Link?
    let previousepisode: Previousepisode?
    
    enum CodingKeys: String, CodingKey {
        case link = "self"
        case previousepisode = "previousepisode"
    }
    
    struct Link: Codable {
        let href: String?
    }
    
    struct Previousepisode: Codable {
        let href: String?
    }
}

struct Image: Codable {
    let medium: String?
    let original: String?
}

struct Externals: Codable {
    let tvrage: Int?
    let thetvdb: Int?
    let imdb: String?
}

struct Network: Codable {
    let id: Int?
    let name: String?
    let country: Country?
    
    struct Country: Codable {
        let name: String?
        let code: String?
        let timezone: String?
    }
}

struct ScheduleSub:Codable {
    let time: String?
    let days: [String]?
}

struct Rating: Codable {
    let average: Float?
}
