//
//  PDFView.swift
//  
//
//  Created by Paul Brendtner on 20.09.23.
//
//
//import SwiftUI
//import PDFKit
//
//struct PDFViewerView: View {
//    let pdfURL: String
//
//    init(pdfURL: String) {
//        self.pdfURL = pdfURL
//    }
//
//    var body: some View {
//        PDFViewRepresentedView(pdfPath: pdfURL)
//    }
//}
//
//
//
//struct PDFViewRepresentedView: NSViewRepresentable {
//    let pdfPath: String
//
//    func makeNSView(context: Context) -> PDFView {
//        return PDFView()
//    }
//
//    func updateNSView(_ uiView: PDFView, context: Context) {
//        if let pdfURL = Bundle.main.url(forResource: pdfPath, withExtension: "pdf") {
//                if let pdfDocument = PDFDocument(url: pdfURL) {
//                    uiView.document = pdfDocument
//                }
//            }
//    }
//}
