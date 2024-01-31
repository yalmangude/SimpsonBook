//
//  File.swift
//  SimpsonBook
//
//  Created by YALMAN GÜDE on 17.08.2023.
//

import Foundation
import UIKit

class Simpson{
    var name = ""
    var job = ""
    var photo :  UIImage //tanımıyor olacak tanıması için  import UIKit yazman lazım
    
    init(nameInit:String , jobInit:String, ImageInit:UIImage){
        name=nameInit
        job=jobInit
        photo=ImageInit
    }
}
