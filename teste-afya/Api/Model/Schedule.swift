//
//  Schedule.swift
//  teste-afya
//
//  Created by Magna on 06/05/21.
//

import Foundation

struct Schedule: Codable {
    
    let id: Int?
    let url: String?
    let name: String?
    let season: Int?
    let number: Int?
    let type: String?
    let airdate: Date?
    let airtime: Date?
    let airstamp: Date?
    let runtime: Int?
    let image: String?
    let summary: String?
    let show: Show?
    let _links: LinkSchedule?
}


struct LinkSchedule: Codable {
    let link: Link
    
    enum CodingKeys: String, CodingKey {
        case link = "self"
    }
    
    struct Link: Codable {
        let href: String?
    }
}

