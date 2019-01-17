//
//  Image.swift
//  ImagePickerView
//
//  Created by Ron Yi on 2019/1/17.
//  Copyright © 2019 Ron Yi. All rights reserved.
//

import Foundation
import UIKit

struct Picture {

    var title: String
    var content: String
    var image: UIImage

    init(title: String, content: String, image: UIImage) {

        self.title = title
        self.content = content
        self.image = image

    }

}
