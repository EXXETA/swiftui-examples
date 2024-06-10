//
//  PdfImporterLoadedView.swift
//  PdfImporter
//
//  Created by Siewert, Laura on 03.05.24.
//

import SwiftUI
import PDFKit

/// A View which shows the loaded pdf  with a bottomsheet
struct PdfImporterLoadedView: View {
	// MARK: - Public Properties
	///Selected PDF from import
	let selectedPdf: PDFDocument
	/// BackToFileImportAction
	let backToFileImportAction: () -> Void

    var body: some View {
		VStack(spacing: 0) {
			PDFKitView(pdf: selectedPdf)
			PdfImporterBottomSheet(
				backToFileImportAction: backToFileImportAction
			)
		}
    }
}
