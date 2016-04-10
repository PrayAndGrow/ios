//
//  SurpriseMeInput.swift
//
//  Created by Kamil Badyla on 09/04/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class SurpriseMeInput: NSObject, Mappable, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kSurpriseMeInputTagsKey: String = "tags"
    internal let kSurpriseMeInputTypesKey: String = "types"
    internal let kSurpriseMeInputDurationLtKey: String = "duration_lt"
    
    
    // MARK: Properties
    public var tags: [Int]?
    public var types: [String]?
    public var durationLt: Int?
    
    
    override init() {
        super.init()
    }
    
    
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
        tags <- map[kSurpriseMeInputTagsKey]
        types <- map[kSurpriseMeInputTypesKey]
        durationLt <- map[kSurpriseMeInputDurationLtKey]
        
    }
    
    /**
     Generates description of the object in the form of a NSDictionary.
     - returns: A Key value pair containing all valid values in the object.
     */
    public func dictionaryRepresentation() -> [String : AnyObject ] {
        
        var dictionary: [String : AnyObject ] = [ : ]
        dictionary.updateValue(tags ?? [], forKey: kSurpriseMeInputTagsKey)
        dictionary.updateValue(types ?? [], forKey: kSurpriseMeInputTypesKey)
        dictionary.updateValue(durationLt ?? 300, forKey: kSurpriseMeInputDurationLtKey)
        
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.tags = aDecoder.decodeObjectForKey(kSurpriseMeInputTagsKey) as? [Int]
        self.types = aDecoder.decodeObjectForKey(kSurpriseMeInputTypesKey) as? [String]
        self.durationLt = aDecoder.decodeObjectForKey(kSurpriseMeInputDurationLtKey) as? Int
        
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(tags, forKey: kSurpriseMeInputTagsKey)
        aCoder.encodeObject(types, forKey: kSurpriseMeInputTypesKey)
        aCoder.encodeObject(durationLt, forKey: kSurpriseMeInputDurationLtKey)
        
    }
    
}
