//
//  ContentType.swift
//  PrayAndGrow
//
//  Created by Kamil Badyla on 09/04/16.
//  Copyright © 2016 Hackatheon. All rights reserved.
//

public enum ContentType {
    case Article, Podcast, Video
    
    func api() -> String {
        switch self {
        case .Article:
            return "AR"
        case .Podcast:
            return "PO"
        case .Video:
            return "VI"
        }
    }
    
    static func contentTypeFrom(apiString : String) -> ContentType? {
        let all = [ContentType.Article, .Podcast, .Video]
        return all.filter { $0.api() == apiString }.first
    }
}
