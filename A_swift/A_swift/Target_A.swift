//
//  Target_A.swift
//  A_swift
//
//  Created by casa on 2017/1/4.
//  Copyright © 2017年 casa. All rights reserved.
//

import UIKit

@objc(Target_A)
class Target_A: NSObject {

    @objc
    func Action_viewController(params:NSDictionary) -> UIViewController {
        
        let block = params["callback"]
        typealias CallbackType = @convention(block) (NSString) -> Void
        
        let blockPtr = UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(block as AnyObject).toOpaque())
        let callback = unsafeBitCast(blockPtr, to: CallbackType.self)
        
        callback("success")
        
        let aViewController = ViewController()
        return aViewController
    }

}
