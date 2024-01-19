//
//  Dimens.swift
//  LottieAnimationExample
//
//  Created by Siewert, Laura on 19.01.24.
//

import Foundation
import UIKit

enum Dimens {
	// MARK: - Opacity
	static let opacity1: Double = 1
	static let opacity05: Double = 0.5

	// MARK: - Padding
	static let padding16: CGFloat = 16
	static let padding100: CGFloat = 100

	// MARK: - Corner Radius
	static let cornerRadius: CGFloat = 16

	// MARK: - Sizes
	static let imageHeight: CGFloat = UIScreen.main.bounds.width
	static let animationHeight: CGFloat = UIScreen.main.bounds.width - Dimens.padding100

	// MARK: - Offsets
	static let offSet0: CGFloat = 0
	static let offSetFull: CGFloat = -UIScreen.main.bounds.height
}
