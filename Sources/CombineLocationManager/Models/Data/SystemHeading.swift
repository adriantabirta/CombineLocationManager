//
//  SystemHeading.swift
//  
//
//  Created by Adrian Tabirta on 31.07.2023.
//

import Foundation

// swiftlint: disable identifier_name line_length
public struct SystemHeading {
    
    /*
     *  magneticHeading
     *
     *  Discussion:
     *    Represents the direction in degrees, where 0 degrees is magnetic North. The direction is referenced from the top of the device regardless of device orientation as well as the orientation of the user interface.
     *
     *  Range:
     *    0.0 - 359.9 degrees, 0 being magnetic North
     */
    public var magneticHeading: Double
    
    /*
     *  trueHeading
     *
     *  Discussion:
     *    Represents the direction in degrees, where 0 degrees is true North. The direction is referenced
     *    from the top of the device regardless of device orientation as well as the orientation of the
     *    user interface.
     *
     *  Range:
     *    0.0 - 359.9 degrees, 0 being true North
     */
    public var trueHeading: Double
    
    /*
     *  headingAccuracy
     *
     *  Discussion:
     *    Represents the maximum deviation of where the magnetic heading may differ from the actual geomagnetic heading in degrees. A negative value indicates an invalid heading.
     */
    public var headingAccuracy: Double
    
    /*
     *  x
     *
     *  Discussion:
     *    Returns a raw value for the geomagnetism measured in the x-axis.
     *
     */
    public var x: Double
    
    /*
     *  y
     *
     *  Discussion:
     *    Returns a raw value for the geomagnetism measured in the y-axis.
     *
     */
    public var y: Double
    
    /*
     *  z
     *
     *  Discussion:
     *    Returns a raw value for the geomagnetism measured in the z-axis.
     *
     */
    public var z: Double
    
    /*
     *  timestamp
     *
     *  Discussion:
     *    Returns a timestamp for when the magnetic heading was determined.
     */
    public var timestamp: Date
    
    public init(magneticHeading: Double, trueHeading: Double, headingAccuracy: Double, x: Double, y: Double, z: Double, timestamp: Date) {
        self.magneticHeading = magneticHeading
        self.trueHeading = trueHeading
        self.headingAccuracy = headingAccuracy
        self.x = x
        self.y = y
        self.z = z
        self.timestamp = timestamp
    }
}
// swiftlint: enable identifier_name line_length
