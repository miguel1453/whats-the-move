//
//  GoogleFonts.swift
//  Whats the Move
//
//  Created by riya on 4/19/23.
//

//<style>
//@import url('https://fonts.googleapis.com/css2?family=Limelight&display=swap');
//</style>

import Foundation
import SwiftUI

enum GoogleFont: String {
    case Limelight = "Limelight"
}

extension Font {
    static func googleFont(_ font: GoogleFont, size: CGFloat) -> Font {
        return Font.custom(font.rawValue, size: size)
    }
}
