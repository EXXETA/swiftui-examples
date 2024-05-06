//
//  PDFKitView.swift
//  PdfImporter
//
//  Created by Siewert, Laura on 06.05.24.
//

import SwiftUI
import PDFKit

/// A Wrapper for UIKit PDFKitView
struct PDFKitView: UIViewRepresentable {
	/// PDF Document to display
	let pdf: PDFDocument

	/// makeUIView
	func makeUIView(context: UIViewRepresentableContext<PDFKitView>) -> PDFView {
		let pdfView = PDFView()
		/// Sets the pdf to full width
		pdfView.autoScales = true
		return pdfView
	}

	/// UpdateUIView
	func updateUIView(_ uiView: PDFView, context: UIViewRepresentableContext<PDFKitView>) {
		DispatchQueue.main.async {
			/// Ensure to always update on main thread
			uiView.document = pdf
		}
	}
}
