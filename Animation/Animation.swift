//
//  Animation.swift
//  Animation
//
//  Created by Nikolai Grachev on 08.11.2023.
//

import Foundation

struct Animation {
    
    var preset: String
    var curve: String
    var force: Double
    var duration: Double
    var delay: Double
        
    static func getAnimation() -> Animation {
        let valuesData = ValuesData()
        
        let animation = Animation(
            preset: valuesData.preset.randomElement() ?? "empty preset",
            curve: valuesData.curve.randomElement() ?? "empty curve",
            force: valuesData.force.randomElement() ?? 0.0,
            duration: valuesData.duration.randomElement() ?? 0.0,
            delay: valuesData.delay.randomElement() ?? 0.0
        )
        return animation
    }
    
    static func getDefaultValues() -> Animation {
        Animation(preset:"empty preset", curve: "empty curve", force: 0.0, duration: 0.0, delay: 0.0)
    }
}

