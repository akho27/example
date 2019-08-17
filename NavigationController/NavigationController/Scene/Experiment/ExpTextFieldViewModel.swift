//
//  ExpTextFieldViewModel.swift
//  NavigationController
//
//  Created by Akingson Chun on 16/07/2019.
//

import Foundation
import RxSwift

class ExpTextFieldViewModel {
    
    struct Input {
        let username: AnyObserver<String>
        let buttonDidTap: AnyObserver<Void>
    }
    
    struct Output {
        let text: Observable<String>
        let prepopulatedText: Observable<String>
    }
    
    private let usernameSubject = BehaviorSubject<String>(value: "")
    private let buttonSubject = PublishSubject<Void>()
    
    let input: Input
    let output: Output
    
    init() {
        
        let prepopulatedText = "Hello world! Kappa 123..."
        let prepopulatedObservable = Observable.just(prepopulatedText)
        
        let text = buttonSubject
            .withLatestFrom(usernameSubject)
        
        input = Input(username: usernameSubject.asObserver(),
                      buttonDidTap: buttonSubject.asObserver())
        
        output = Output(text: text,
                        prepopulatedText: prepopulatedObservable)
        
    }
    
}
