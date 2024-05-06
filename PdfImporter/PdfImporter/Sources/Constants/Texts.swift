//
//  Texts.swift
//  PdfImporter
//
//  Created by Siewert, Laura on 06.05.24.
//

import Foundation

/// Stores the texts used in the app
enum Texts {
	static let emptyPdfTitle = "No PDF selected"
	static let emptyPdfDescription = "You did not select a PDF click on the button to import a pdf"
	static let backtToFileImportButtonTitle = "Back to file import"
	static let importAnotherPdf = "Import another PDF"
	static let loadingPdf = "Your selected PDF is being loaded"
	static let importErrorTitle = "PDF could not be imported"
	static let importErrorDescription = "Something went wrong while trying to import your selected PDF. Please try to import another PDF Document"
	static let pageLimitErrorTitle = "Page Limit reached"
	static let pageLimitErrorDescription = "Your PDF has too many pages, please try to import a smaller pdf"
}
