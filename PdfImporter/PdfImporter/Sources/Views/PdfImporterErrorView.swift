//
//  PdfImporterErrorView.swift
//  PdfImporter
//
//  Created by Siewert, Laura on 03.05.24.
//

import SwiftUI

/// View which will be shown if an error accured while importing a pdf
struct PdfImporterErrorView: View {
	/// Error for importing a pdf
	let pdfError: PDFError
	/// Back to file import action
	let backToFileImportAction: () -> Void

    var body: some View {
		VStack(spacing: 0) {
			Spacer()
			Image(pdfError.illustrationName)
				.resizable()
				.scaledToFit()
				.frame(height: Dimens.imageSize)
				.padding(.bottom, Dimens.unit40)
			Text(pdfError.title)
				.font(.title)
				.padding(.bottom, Dimens.unit16)
			Text(pdfError.description)
				.multilineTextAlignment(.center)
			Spacer()
			Button(
				pdfError.buttonTitle,
				action: backToFileImportAction
			)
			.buttonStyle(.borderedProminent)
			.padding(.bottom, Dimens.unit16)
		}
		.padding(.horizontal, Dimens.unit20)
		.background(.white)
    }
}
