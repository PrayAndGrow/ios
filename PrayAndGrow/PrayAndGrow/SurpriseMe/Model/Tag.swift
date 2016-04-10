//
//  Tag.swift
//
//  Created by Kamil Badyla on 09/04/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Tag: NSObject, Mappable, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kTagInternalIdentifierKey: String = "id"
    internal let kTagTagKey: String = "tag"
    
    
    // MARK: Properties
    public var internalIdentifier: Int?
    public var tag: String?
    
    
    
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
        internalIdentifier <- map[kTagInternalIdentifierKey]
        tag <- map[kTagTagKey]
        
    }
    
    /**
     Generates description of the object in the form of a NSDictionary.
     - returns: A Key value pair containing all valid values in the object.
     */
    public func dictionaryRepresentation() -> [String : AnyObject ] {
        
        var dictionary: [String : AnyObject ] = [ : ]
        if internalIdentifier != nil {
            dictionary.updateValue(internalIdentifier!, forKey: kTagInternalIdentifierKey)
        }
        if tag != nil {
            dictionary.updateValue(tag!, forKey: kTagTagKey)
        }
        
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.internalIdentifier = aDecoder.decodeObjectForKey(kTagInternalIdentifierKey) as? Int
        self.tag = aDecoder.decodeObjectForKey(kTagTagKey) as? String
        
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(internalIdentifier, forKey: kTagInternalIdentifierKey)
        aCoder.encodeObject(tag, forKey: kTagTagKey)
        
    }
    
}
