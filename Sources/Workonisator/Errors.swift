//
//  Errors.swift
//  
//
//  Created by Paul Brendtner on 20.09.23.
//

import Firebase
import Foundation


public enum AuthError: Error, LocalizedError {
    case unbekannterFehler
    case ungültigeEmail
    case emailBereitsVerwendet
    case userNichtGefunden
    case falschesPasswort
    case schwachesPasswort
    
    public init(_ error: Error) {
        if let errorCode = AuthErrorCode.Code(rawValue: (error as NSError).code) {
            switch errorCode {
            case .invalidEmail:
                self = .ungültigeEmail
            case .emailAlreadyInUse:
                self = .emailBereitsVerwendet
            case .userNotFound:
                self = .userNichtGefunden
            case .wrongPassword:
                self = .falschesPasswort
            case .weakPassword:
                self = .schwachesPasswort
                
            default:
                self = .unbekannterFehler
            }
        } else {
            self = .unbekannterFehler
        }
    }

    public var localizedDescription: String {
        switch self {
        case .unbekannterFehler:
            return NSLocalizedString("Leider ist ein unbekannter Fehler  aufgetreten, probieren sie es bitte erneut.", comment: "Unbekannter Fehler")
        case .ungültigeEmail:
            return NSLocalizedString("Die Email ist leider ungültig, probieren sie bitte eine andere Email-Adresse.", comment: "Ungültige Email")
        case .falschesPasswort:
            return NSLocalizedString("Leider stimmt das Passwort nicht mit diesem Konto überein", comment: "Falsches Passwort")
        case .userNichtGefunden:
            return NSLocalizedString("Leider wurde kein Benutzer zu dieser Email gefunden, bitte überprüfen sie ihre Email-Adresse", comment: "Benutzer nicht gefunden")
        case .emailBereitsVerwendet:
            return NSLocalizedString("Leider wird dieser Email bereits von einem anderen Konto verwendet", comment: "Email bereits verwendet")
        case .schwachesPasswort:
            return NSLocalizedString("Das Passwort ist sehr leicht zu erraten, bitte wähle ein anderes.", comment: "Schwaches Passwort")
        }
    }
}



public enum FirestoreError: Error, LocalizedError{
    
    case docNichtGefunden
    case keineErlaubnis
    case unbekannterFehler
    case keineAuthDaten
    case nichtVerfügbar
    
    public init(_ error: Error){
        if let errorCode = FirestoreErrorCode.Code(rawValue: (error as NSError).code){
            switch errorCode{
            case .notFound:
                self = .docNichtGefunden
            case .permissionDenied:
                self = .keineErlaubnis
            case .unauthenticated:
                self = .keineAuthDaten
            case .unavailable:
                self = .nichtVerfügbar
            case .unknown:
                self = .unbekannterFehler
                
            default:
                self = .unbekannterFehler
            }
        } else {
            self = .unbekannterFehler
        }
    }
    
    
    public var localizedDescription: String{
        switch self{
        case .docNichtGefunden:
            return NSLocalizedString("Leider wurde kein Dokument mit der entsprechenden ID gefunden. Bitte prüfe, ob das Dokument wirklich existiert", comment: "Kein Dokument zur ID gefunden")
            
        case .keineErlaubnis:
            return NSLocalizedString("Du hast leider keine Erlaubnis diese Aktion auszuführen.", comment: "Keine Erlaubnis")
            
        case .unbekannterFehler:
            return NSLocalizedString("Leider ist ein unbekannter Fehler aufgetreten. Bitte probiere es erneut", comment: "Unbekannter Fehler")
            
        case .keineAuthDaten:
            return NSLocalizedString("Leider ist kein Benutzer angemeldet, bitte überprüfe ob du authentifiziert bist.", comment: "Kein authentifizierter User")
            
        case .nichtVerfügbar:
            return NSLocalizedString("Diese Aktion ist leider vorübergehend nicht verfügbar. Bitte probiere diese Aktion später noch einmal", comment: "Nicht verfügbar")
        }
    }
    
}
