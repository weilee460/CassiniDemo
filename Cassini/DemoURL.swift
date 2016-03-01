//
//  DemoURL.swift
//  Cassini
//
//  Created by ying on 16/2/29.
//  Copyright © 2016年 ying. All rights reserved.
//

import Foundation

struct DemoURL {
    /*
    static let Stanford = NSURL(string: "http://comm.stanford.edu/wp-content/uploads/2013/01/stanford-campus.png")
    */
    //modify URL to local server, because stanford wensite can not open for some reason
    static let Stanford = NSURL(string: "ftp://192.168.10.3/stanford-campus.png")
    
    struct NASA {
        //static let Cassini = NSURL(string: "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg")
        static let Cassini = NSURL(string: "http://pds-rings.seti.org/saturn/cassini/jpegMod/PIA03883_modest.jpg")
        
        static let Earth = NSURL(string: "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg")
        static let Saturn = NSURL(string: "http://www.nasa.gov/sites/default/files/saturn_collage.jpg")
    }
}
