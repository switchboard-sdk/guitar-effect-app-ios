//
//  ViewController.swift
//  GuitarEffectApp
//
//  Created by Balazs Kiss on 2023. 06. 25..
//

import UIKit
import SwitchboardUI

class ViewController: UIViewController {

    let engine = GuitarEffectEngine()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        engine.start()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let viewController = UIGenerator.generateViewController(audioGraph: engine.audioGraph)
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: false)
    }


}

