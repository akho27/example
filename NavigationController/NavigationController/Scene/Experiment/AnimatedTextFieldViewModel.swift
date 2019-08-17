//
//  AnimatedTextFieldViewModel.swift
//  NavigationController
//
//  Created by Akingson Chun on 12/07/2019.
//

import Foundation
import RxSwift

class AnimatedTextFieldViewModel {
    
    struct Input {
        let username: AnyObserver<String>
    }
    
    private let usernameSubject = BehaviorSubject<String>(value: "")
    
    let input: Input
    
    init() {
        input = Input(username: usernameSubject.asObserver())
    }
    
    
    
    
    
}
