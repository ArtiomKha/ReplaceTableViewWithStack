//
//  DailyWeatherView.swift
//  ReplaceTableWithStackStarting
//
//  Created by Artsiom Khaliliayeu on 25.02.23.
//

import UIKit

class DailyWeatherView: UIView {

	let stackView: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.alignment = .fill
		stack.distribution = .fill
		stack.spacing = 8
		stack.axis = .vertical
		stack.isLayoutMarginsRelativeArrangement = true
		stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
		return stack
	}()

	let dayLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .left
		label.font = .systemFont(ofSize: 16, weight: .semibold)
		label.textColor = #colorLiteral(red: 0.5839449179, green: 0.5839449179, blue: 0.5839449179, alpha: 1)
		return label
	}()

	let tempStackView: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.alignment = .center
		stack.distribution = .equalCentering
		return stack
	}()

	let minTempLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .left
		label.textColor = #colorLiteral(red: 0.6144846907, green: 0.6144846907, blue: 0.6144846907, alpha: 1)
		label.font = .systemFont(ofSize: 24, weight: .semibold)
		return label
	}()

	let iconImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()

	let maxTempLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .left
		label.textColor = #colorLiteral(red: 0.1489307134, green: 0.1489307134, blue: 0.1489307134, alpha: 1)
		label.font = .systemFont(ofSize: 24, weight: .semibold)
		return label
	}()


	init() {
		super.init(frame: .zero)
		setup()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}

	func setup() {
		addSubview(stackView)
		[dayLabel, tempStackView].forEach { stackView.addArrangedSubview($0) }
		[minTempLabel, iconImageView, maxTempLabel].forEach { tempStackView.addArrangedSubview($0) }
		setConstraints()
	}

	func setConstraints() {
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
			iconImageView.heightAnchor.constraint(equalToConstant: 36),
			iconImageView.widthAnchor.constraint(equalToConstant: 36)
		])
	}

	func set(_ weather: WeatherModel) {
		dayLabel.text = weather.day
		minTempLabel.text = weather.minTempString
		maxTempLabel.text = weather.maxTempString
		iconImageView.image = weather.icon
	}
}
