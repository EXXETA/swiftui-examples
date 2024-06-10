//
//  EmptyPdfImporterView.swift
//  PdfImporter
//
//  Created by Siewert, Laura on 03.05.24.
//

import SwiftUI
/// View which will be shown, when the user did not select a pdf
struct EmptyPdfImporterView: View {
	/// Action to open file importer
	let backToFileImportAction: () -> Void

    var body: some View {
		VStack(spacing: 0) {
			Spacer()
			Image(ImageNames.empty)
				.resizable()
				.frame(
					width: Dimens.imageSize,
					height: Dimens.imageSize
				)
				.scaledToFit()
				.padding(.bottom, Dimens.unit40)
			Text(Texts.emptyPdfTitle)
				.font(.title)
				.multilineTextAlignment(.center)
				.padding(.bottom, Dimens.unit16)
			Text(Texts.emptyPdfDescription)
				.multilineTextAlignment(.center)
			Spacer()
			Button(
				Texts.backToFileImportButtonTitle,
				action: backToFileImportAction
			)
			.buttonStyle(.borderedProminent)
			.padding(.bottom, Dimens.unit16)
		}
		.padding(.horizontal, Dimens.unit20)
		.preferredColorScheme(.light)
    }
}
