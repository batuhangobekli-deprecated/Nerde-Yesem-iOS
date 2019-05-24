//
//  RestaurantDetailResponse.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 24.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation

struct RestaurantDetailResponse : Codable {
    let r : R?
    let apikey : String?
    let id : String?
    let name : String?
    let url : String?
    let location : Location?
    let switch_to_order_menu : Int?
    let cuisines : String?
    let average_cost_for_two : Int?
    let price_range : Int?
    let currency : String?
    let offers : [String]?
    let opentable_support : Int?
    let is_zomato_book_res : Int?
    let mezzo_provider : String?
    let is_book_form_web_view : Int?
    let book_form_web_view_url : String?
    let book_again_url : String?
    let thumb : String?
    let user_rating : UserRating?
    let photos_url : String?
    let menu_url : String?
    let featured_image : String?
    let has_online_delivery : Int?
    let is_delivering_now : Int?
    let phoneNumber:String?
    let include_bogo_offers : Bool?
    let deeplink : String?
    let is_table_reservation_supported : Int?
    let has_table_booking : Int?
    let events_url : String?
    
    enum CodingKeys: String, CodingKey {
        
        case r = "R"
        case apikey = "apikey"
        case id = "id"
        case name = "name"
        case url = "url"
        case location = "location"
        case switch_to_order_menu = "switch_to_order_menu"
        case cuisines = "cuisines"
        case average_cost_for_two = "average_cost_for_two"
        case price_range = "price_range"
        case currency = "currency"
        case offers = "offers"
        case phoneNumber = "phone_numbers"
        case opentable_support = "opentable_support"
        case is_zomato_book_res = "is_zomato_book_res"
        case mezzo_provider = "mezzo_provider"
        case is_book_form_web_view = "is_book_form_web_view"
        case book_form_web_view_url = "book_form_web_view_url"
        case book_again_url = "book_again_url"
        case thumb = "thumb"
        case user_rating = "user_rating"
        case photos_url = "photos_url"
        case menu_url = "menu_url"
        case featured_image = "featured_image"
        case has_online_delivery = "has_online_delivery"
        case is_delivering_now = "is_delivering_now"
        case include_bogo_offers = "include_bogo_offers"
        case deeplink = "deeplink"
        case is_table_reservation_supported = "is_table_reservation_supported"
        case has_table_booking = "has_table_booking"
        case events_url = "events_url"
    }
}

