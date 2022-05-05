//
//  Kitap.swift
//  HW6
//
//  Created by Irmak Zenger on 5/4/22.
//

import Foundation

class Kitap{
    var kitap_id : Int?
    var kitap_adi : String?
    var kitap_yazar_adi : String?
    var kitap_kategori_adi : String?
    var kitap_resim_adi : String?
    
    
    
    init(kitap_id : Int, kitap_adi : String, kitap_yazar_adi : String, kitap_kategori_adi : String, kitap_resim_adi : String){
        self.kitap_id = kitap_id
        self.kitap_adi = kitap_adi
        self.kitap_yazar_adi = kitap_yazar_adi
        self.kitap_kategori_adi = kitap_kategori_adi
        self.kitap_resim_adi = kitap_resim_adi
    }
}
