//
// LocationDetailResponseComment.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


open class LocationDetailResponseComment: JSONEncodable {

    public var content: String?
    public var name: String?
    public var imageUrl: String?

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["content"] = self.content
        nillableDictionary["name"] = self.name
        nillableDictionary["imageUrl"] = self.imageUrl

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
