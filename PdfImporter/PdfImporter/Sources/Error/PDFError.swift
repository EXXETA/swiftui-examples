//
//  PDFError.swift
//  PdfImporter
//
//  Created by Siewert, Laura on 06.05.24.
//

import Foundation

/// A Protocol for every created error
protocol PDFError {
	/// A prefix to identify the error
	var prexif: String { get }
	/// Name of the illustration
	var illustrationName: String { get }
	/// A title to show to the user
	var title: String { get }
	/// A description to show to the user
	var description: String { get }
	/// A title on the button to show to the user
	var buttonTitle: String { get }
}

/// Error for PDF import
struct PDFImportError: PDFError, Error {
	var prexif: String = "PDFImportError"
	var illustrationName: String = ImageNames.error
	var title: String = Texts.importErrorTitle
	var description: String = Texts.importErrorDescription
	var buttonTitle: String = Texts.importAnotherPdf
}

/// Error for pdf page limit
struct PDFPageLimitError: PDFError, Error {
	var prexif: String = "PDFImportError"
	var illustrationName: String = ImageNames.pageLimit
	var title: String = Texts.pageLimitErrorTitle
	var description: String = Texts.pageLimitErrorDescription
	var buttonTitle: String = Texts.importAnotherPdf
}

