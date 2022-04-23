//
//  Extensions.swift
//  NetflixClone
//
//  Created by Daniel Jiang on 4/18/22.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
