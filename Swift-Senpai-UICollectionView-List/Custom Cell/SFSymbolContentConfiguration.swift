//
//  SFSymbolContentConfiguration.swift
//  Swift-Senpai-UICollectionView-List
//
//  Created by Lee Kah Seng on 01/08/2020.
//

import Foundation
import UIKit

// Act as view model
struct SFSymbolContentConfiguration: UIContentConfiguration, Hashable {
    
    // All will be optional
    var name: String?
    var symbol: UIImage?
    var nameColor: UIColor?
    var symbolColor: UIColor?
    var symbolWeight: UIImage.SymbolWeight?
    var fontWeight: UIFont.Weight?
    
    func makeContentView() -> UIView & UIContentView {
        return SFSymbolVerticalContentView(configuration: self)
    }
    
    func updated(for state: UIConfigurationState) -> Self {
        
        // Perform update on parameters that does not related to cell's data itesm
        
        guard let state = state as? UICellConfigurationState else {
            return self
        }
        
        var updatedConfiguration = self
        if state.isSelected {
            // Selected state
            updatedConfiguration.nameColor = .systemPink
            updatedConfiguration.symbolColor = .systemPink
            updatedConfiguration.fontWeight = .heavy
            updatedConfiguration.symbolWeight = .heavy
        } else {
            // Other states
            updatedConfiguration.nameColor = .systemBlue
            updatedConfiguration.symbolColor = .systemBlue
            updatedConfiguration.fontWeight = .regular
            updatedConfiguration.symbolWeight = .regular
        }

        return updatedConfiguration
    }
    
}
