//
//  Formatter.swift
//  CoupangEats Clone
//
//  Created by 송영훈 on 2022/12/14.
//

import UIKit

func numberFormatter(number: Int) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    
    return numberFormatter.string(from: NSNumber(value: number))!
}

