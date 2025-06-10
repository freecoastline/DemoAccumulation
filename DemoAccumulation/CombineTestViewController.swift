//
//  CombineTestViewController.swift
//  DemoAccumulation
//
//  Created by ken on 2025/6/8.
//

import Foundation
import UIKit
import Combine

class CombineTestViewController:UIViewController {
    @Published var currentString = ["first"]
    
    var cancellable = Set<AnyCancellable>()
    
    lazy var label:UILabel = {
        let tempLabel = UILabel()
        tempLabel.sizeToFit()
        return tempLabel
    }()
        
    override func viewDidLoad() {
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        view.backgroundColor = .red
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(changeCurrentString))
        view.addGestureRecognizer(tapGesture)
        tapGesture.delegate = self
        setupBinding()
    }
    
    @objc
    func changeCurrentString() {
        currentString = ["changed"]
    }

    func setupBinding() {
        currentString.publisher
                     .sink { completion in
                         switch completion {
                         case .finished:
                             return
                         case .failure:
                             return
                         }
                     } receiveValue: {
                         [weak self] in
                         self?.label.text = $0
                         self?.label.sizeToFit()
                     }
                     .store(in: &cancellable)
        
        [1, 2, 3]
                .publisher
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        print("Something went wrong: \(error)")
                    case .finished:
                        print("Received Completion")
                    }
                }, receiveValue: { value in
                    print("Received value \(value)")
                })
    }
}


extension CombineTestViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
