//
//  ViewController.swift
//  ReplaceTableWithStackStarting
//
//  Created by Artsiom Khaliliayeu on 25.02.23.
//

import UIKit

class ViewController: UIViewController {

	var rootView: MainView {
		view as! MainView
	}

	override func loadView() {
		view = MainView()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


}

