//
//  PdfImporterLoadingView.swift
//  PdfImporter
//
//  Created by Siewert, Laura on 03.05.24.
//

import SwiftUI

/// View which will be shown, when pdf is loading
struct PdfImporterLoadingView: View {
    var body: some View {
		VStack(alignment: .center, spacing: 0) {
			Spacer()
			ProgressView()
				.frame(width: Dimens.unit56, height: Dimens.unit56)
				.padding(.vertical, Dimens.unit16)
				.padding(.bottom, Dimens.unit8)
			Text(Texts.loadingPdf)
			Spacer()
			PdfImporterBottomSheet()
		}
		.frame(maxWidth: .infinity)
    }
}
