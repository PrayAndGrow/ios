//
//  BrainBit.swift
//
//  Created by Kamil Badyla on 09/04/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class BrainBit: NSObject, Mappable, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kBrainBitTitleKey: String = "title"
    internal let kBrainBitTagsKey: String = "tags"
    internal let kBrainBitInternalIdentifierKey: String = "id"
    internal let kBrainBitDescriptionValueKey: String = "description"
    internal let kBrainBitImageKey: String = "image"
    internal let kBrainBitDurationKey: String = "duration"
    internal let kBrainBitUrlKey: String = "url"
    internal let kBrainBitTypeKey: String = "type"
    
    
    // MARK: Properties
    public var title: String?
    public var tags: [Tag]?
    public var internalIdentifier: Int?
    public var descriptionValue: String?
    public var image: String?
    public var duration: String?
    public var url: String?
    public var type: ContentType?
    
    
    
    // MARK: ObjectMapper Initalizers
    /**
     Map a JSON object to this class using ObjectMapper
     - parameter map: A mapping from ObjectMapper
     */
    required public init?(_ map: Map){
        
    }
    
    /**
     Map a JSON object to this class using ObjectMapper
     - parameter map: A mapping from ObjectMapper
     */
    public func mapping(map: Map) {
        title <- map[kBrainBitTitleKey]
        tags <- map[kBrainBitTagsKey]
        internalIdentifier <- map[kBrainBitInternalIdentifierKey]
        descriptionValue <- map[kBrainBitDescriptionValueKey]
        image <- map[kBrainBitImageKey]
        duration <- map[kBrainBitDurationKey]
        url <- map[kBrainBitUrlKey]
        type = ContentType.contentTypeFrom(map[kBrainBitTypeKey].valueOr(""))
        
    }
    
    /**
     Generates description of the object in the form of a NSDictionary.
     - returns: A Key value pair containing all valid values in the object.
     */
    public func dictionaryRepresentation() -> [String : AnyObject ] {
        
        var dictionary: [String : AnyObject ] = [ : ]
        if title != nil {
            dictionary.updateValue(title!, forKey: kBrainBitTitleKey)
        }
        if tags?.count > 0 {
            var temp: [AnyObject] = []
            for item in tags! {
                temp.append(item.dictionaryRepresentation())
            }
            dictionary.updateValue(temp, forKey: kBrainBitTagsKey)
        }
        if internalIdentifier != nil {
            dictionary.updateValue(internalIdentifier!, forKey: kBrainBitInternalIdentifierKey)
        }
        if descriptionValue != nil {
            dictionary.updateValue(descriptionValue!, forKey: kBrainBitDescriptionValueKey)
        }
        if image != nil {
            dictionary.updateValue(image!, forKey: kBrainBitImageKey)
        }
        if duration != nil {
            dictionary.updateValue(duration!, forKey: kBrainBitDurationKey)
        }
        if url != nil {
            dictionary.updateValue(url!, forKey: kBrainBitUrlKey)
        }
        if type != nil {
            dictionary.updateValue(type!.api(), forKey: kBrainBitTypeKey)
        }
        
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObjectForKey(kBrainBitTitleKey) as? String
        self.tags = aDecoder.decodeObjectForKey(kBrainBitTagsKey) as? [Tag]
        self.internalIdentifier = aDecoder.decodeObjectForKey(kBrainBitInternalIdentifierKey) as? Int
        self.descriptionValue = aDecoder.decodeObjectForKey(kBrainBitDescriptionValueKey) as? String
        self.image = aDecoder.decodeObjectForKey(kBrainBitImageKey) as? String
        self.duration = aDecoder.decodeObjectForKey(kBrainBitDurationKey) as? String
        self.url = aDecoder.decodeObjectForKey(kBrainBitUrlKey) as? String
        self.type = ContentType.contentTypeFrom((aDecoder.decodeObjectForKey(kBrainBitTypeKey) as? String)!)
        
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: kBrainBitTitleKey)
        aCoder.encodeObject(tags, forKey: kBrainBitTagsKey)
        aCoder.encodeObject(internalIdentifier, forKey: kBrainBitInternalIdentifierKey)
        aCoder.encodeObject(descriptionValue, forKey: kBrainBitDescriptionValueKey)
        aCoder.encodeObject(image, forKey: kBrainBitImageKey)
        aCoder.encodeObject(duration, forKey: kBrainBitDurationKey)
        aCoder.encodeObject(url, forKey: kBrainBitUrlKey)
        aCoder.encodeObject(type?.api(), forKey: kBrainBitTypeKey)
        
    }
    
    func imageURL() -> NSURL {
        if let url = self.image {
            return NSURL(string: url) ?? NSURL()
        }
        return NSURL()
    }
    


}
