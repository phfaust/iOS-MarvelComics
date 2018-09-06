//
//  HelperFunctions.swift
//  WhatsThatGame
//
//  Created by Fiel Faustino on 16/08/2018.
//  Copyright © 2018 Fiel Faustino. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func heightWithConstraintWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesFontLeading, .usesLineFragmentOrigin], attributes: [.font: font], context: nil)
        
        return boundingBox.height
    }
    
    func widthWithConstraintHeight(height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesFontLeading, .usesLineFragmentOrigin], attributes: [.font: font], context: nil)
        
        return boundingBox.width
    }
}
