//
//  MainView.swift
//  ReplaceTableWithStackStarting
//
//  Created by Artsiom Khaliliayeu on 25.02.23.
//

import UIKit

class MainView: UIView {

	let stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.alignment = .fill
		stackView.distribution = .fill
		stackView.axis = .vertical
		return stackView
	}()

	var weatherViews = [DailyWeatherView]()

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
		addSubview(stackView)
		setConstaints()
	}

	func setConstaints() {
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
		])
	}

	func update(with data: [WeatherModel]) {
		weatherViews.removeAll()
		stackView.removeAllArrangedSubviews()
		data.enumerated().forEach {
			let view = DailyWeatherView()
			view.translatesAutoresizingMaskIntoConstraints = false
			view.tag = $0.offset
			view.set($0.element)
			view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(weatherViewTapped(_:))))
			weatherViews.append(view)
			stackView.addArrangedSubview(view)
		}
	}

	@objc private func weatherViewTapped(_ sender: UITapGestureRecognizer?) {
		guard let weatherView = sender?.view as? DailyWeatherView else { return }
		print(weatherView.tag)
	}
	
}

extension UIStackView {
	func removeAllArrangedSubviews() -> [UIView] {
		let removedSubviews = arrangedSubviews.reduce([]) { (removedSubviews, subview) -> [UIView] in
			 self.removeArrangedSubview(subview)
			 NSLayoutConstraint.deactivate(subview.constraints)
			 subview.removeFromSuperview()
			 return removedSubviews + [subview]
		}
		return removedSubviews
	}

}
