//
//  PDFImporterBottomSheet.swift
//  PdfImporter
//
//  Created by Siewert, Laura on 03.05.24.
//

import SwiftUI

/// Bottomsheet displayed above selected pdf
struct PdfImporterBottomSheet: View {
	/// BackToFileImportAction
	var backToFileImportAction: (() -> Void)?

	/// Body
	var body: some View {
		VStack(spacing: 0) {
			Button(
				Texts.importAnotherPdf,
				action: backToFileImportAction ?? {}
			)
			.buttonStyle(.borderedProminent)
		}
		.frame(maxWidth: .infinity)
		.padding(.vertical, Dimens.unit20)
		.padding(.horizontal, Dimens.unit20)
		.background(.white)
		.background(
			Color.white
				.shadow(
					color: Color.black.opacity(Dimens.opacity16),
					radius: Dimens.unit8
				)
		)
	}
}
