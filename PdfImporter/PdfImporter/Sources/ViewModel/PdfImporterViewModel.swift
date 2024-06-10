//
//  PdfImporterViewModel.swift
//  PdfImporter
//
//  Created by Siewert, Laura on 03.05.24.
//

import Combine
import PDFKit

extension PdfImporterViewModel {
	/// States for loading pdfs
	enum PdfImporterState: Equatable {
		/// PDF is loading
		case loading
		/// An error occured while loading
		case error(PDFError)
		/// PDF loaded
		case loaded(PDFDocument)
		/// No pdf selected
		case empty

		/// Equatble Func
		static func == (
			lhs: PdfImporterViewModel.PdfImporterState,
			rhs: PdfImporterViewModel.PdfImporterState
		) -> Bool {
			switch (lhs, rhs) {
				case (.loading, .loading):
					return true
				case (.loaded, .loaded):
					return false
				case (.error(let lhsError), .error(let rhsError)):
					return lhsError.prexif == rhsError.prexif
				case (.empty, .empty):
					return true
				default:
					return false
			}
		}
	}
}

/// VIewmodel for edit pdf view
class PdfImporterViewModel: ObservableObject {

	// MARK: - Published Properties
	/// Indicates if selectedPdf view should be shown
	@Published var isPresentingPdfImport: Bool = true
	/// PdfImporterState
	@Published var pdfImporterState: PdfImporterState = .empty

	// MARK: - Private Properties
	/// Limit for importing pdfs
	private let pdfPageLimit = 20

	// MARK: - Public Functions
	/// Pdf was selected, set state to loading, import PDF and check given requirements
	public func pdfWasSelected(result: Result<URL, Error>) {
		pdfImporterState = .loading
		/// Load pdf in background
		switch result {
			case .success(let url):
				Task {
					/// Check Secuirty
					guard
						url.startAccessingSecurityScopedResource(),
						let pdfDocument = PDFDocument(url: url)
					else {
						/// startAccessingSecurityScopedResource returns false e.g. when trying to upload virus
						url.stopAccessingSecurityScopedResource()
						Task.detached { @MainActor in
							self.pdfImporterState = .error(PDFImportError())
						}
						return
					}

					/// Check if limit of 20 pages is not exceeded
					guard pdfDocument.pageCount <= self.pdfPageLimit else {
						Task.detached { @MainActor in
							self.pdfImporterState = .error(PDFPageLimitError())
						}
						return
					}

					Task.detached { @MainActor in
						self.pdfImporterState = .loaded(pdfDocument)
					}
					url.stopAccessingSecurityScopedResource()
				}
			case .failure:
				/// Error from apple fileimporter (corrupt files for e.g.)
				pdfImporterState = .error(PDFImportError())
		}
	}


	/// Shows pdf importer
	public func showPdfImporter() {
		isPresentingPdfImport = true
	}
}
