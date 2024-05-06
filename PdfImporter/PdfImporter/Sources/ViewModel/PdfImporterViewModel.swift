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
		/// Load pdf in background
		DispatchQueue.global(qos: .background).async { [weak self] in
			guard let self else { return }
			/// Make UI changes on main thread
			DispatchQueue.main.async { [weak self] in
				self?.pdfImporterState = .loading
			}
			switch result {
				case .success(let url):
					guard
						url.startAccessingSecurityScopedResource(),
						let pdfDocument = PDFDocument(url: url)
					else {
						/// startAccessingSecurityScopedResource returns false e.g. when trying to upload virus
						DispatchQueue.main.async { [weak self] in
							self?.pdfImporterState = .error(PDFImportError())
						}
						url.stopAccessingSecurityScopedResource()
						return
					}

					/// Check if limit of 20 pages is not exceeded
					guard pdfDocument.pageCount <= self.pdfPageLimit else {
						DispatchQueue.main.async { [weak self] in
							self?.pdfImporterState = .error(PDFPageLimitError())
						}
						return
					}

					DispatchQueue.main.async { [weak self] in
						self?.pdfImporterState = .loaded(pdfDocument)
					}
					url.stopAccessingSecurityScopedResource()
				case .failure:
					/// Error from apple fileimporter (corrupt files for e.g.)
					DispatchQueue.main.async { [weak self] in
						self?.pdfImporterState = .error(PDFImportError())
					}
			}
		}
	}


	/// Shows pdf importer
	public func showPdfImporter() {
		isPresentingPdfImport = true
	}
}
