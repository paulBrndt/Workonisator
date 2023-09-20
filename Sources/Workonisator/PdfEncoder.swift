//
//  PdfEncoder.swift
//  
//
//  Created by Paul Brendtner on 20.09.23.
//

import Foundation


struct PdfEncoder{
    
    /// <#Description#>
    /// - Parameter name: Der Dateiname deines Dokumentes ohne .pdf Endung
    /// - Returns: <#description#>
    func encodePdf(withName name: String) throws -> Data {
        guard let pdfUrl = Bundle.main.url(forResource: name, withExtension: "pdf") else { throw EncodingError.dateiNichtGefunden }
            do {
                let data = try Data(contentsOf: pdfUrl)
                return data
            } catch {
                throw error
            }
    }
    
}


