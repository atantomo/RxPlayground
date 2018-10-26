//
//  ViewController.swift
//  RxPlayground
//
//  Created by Andrew Tantomo on 2018/10/26.
//  Copyright © 2018年 Andrew Tantomo. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let emblem: Variable<String> = Variable("")
    var disposeBag: DisposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func blueButtonTapped(_ sender: UIButton) {
        emblem.value = "emblem data"
    }

    @IBAction func pinkButtonTapped(_ sender: UIButton) {
        disposeBag = DisposeBag()
        let doOnNext = { (next: String) in
            print("doOnNext")
        }
        let doOnDispose = {
            print("do on next emblem received")
        }
        let subscribeOnNext = { (next: String) in
            print("subscribeOnNext")
        }
        emblem.asObservable()
            .do(onNext: doOnNext, onDispose: doOnDispose)
            .subscribe(onNext: subscribeOnNext)
            .disposed(by: disposeBag)
    }

}

