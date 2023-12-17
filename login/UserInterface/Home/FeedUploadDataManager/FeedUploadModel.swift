//
//  FeedUploadModel.swift
//  login
//
//  Created by 김민솔 on 2023/12/17.
//

struct FeedUploadModel : Decodable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : FeedUploadResult?
}
struct FeedUploadResult : Decodable {
    var postIdx : Int?
}
