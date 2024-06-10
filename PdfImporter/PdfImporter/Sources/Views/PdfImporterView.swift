//
//  PdfImporterView.swift
//  PdfImporter
//
//  Created by Siewert, Laura on 03.05.24.
//

import SwiftUI
import PDFKit

/// View which manages which view to display by statae
struct PdfImporterView: View {
	/// StateObject of view
	@StateObject var viewModel: PdfImporterViewModel = PdfImporterViewModel()

    var body: some View {
		ZStack {
			switch viewModel.pdfImporterState {
				case .loading:
					PdfImporterLoadingView()
				case .loaded(let selecedPdf):
					PdfImporterLoadedView(
						selectedPdf: selecedPdf,
						backToFileImportAction: viewModel.showPdfImporter
					)
				case .error(let error):
					PdfImporterErrorView(
						pdfError: error,
						backToFileImportAction: viewModel.showPdfImporter
					)
				case .empty:
					EmptyPdfImporterView(
						backToFileImportAction: viewModel.showPdfImporter
					)
			}
		}
		.fileImporter(
			isPresented: $viewModel.isPresentingPdfImport,
			allowedContentTypes: [.pdf]
		) { result in
			viewModel.pdfWasSelected(result: result)
		}
    }
}
