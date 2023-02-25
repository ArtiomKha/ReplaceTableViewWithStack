//
//  MainView.swift
//  ReplaceTableWithStackStarting
//
//  Created by Artsiom Khaliliayeu on 25.02.23.
//

import UIKit

class MainView: UIView {

	init() {
		super.init(frame: .zero)
		setup()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}

	func setup() {
		backgroundColor = .white

	}
}
