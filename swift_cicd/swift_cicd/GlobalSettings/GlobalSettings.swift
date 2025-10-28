import Foundation



enum BuildEnv: String {
    case dev
    case stag
    case release
}

extension BuildEnv{
    static var current:BuildEnv {
        get {
            if let rawVal = Bundle.main.infoDictionary?["APP_ENV"] as? String {
                guard let type = BuildEnv(rawValue: rawVal) else {
                    preconditionFailure("APP_ENV could not be nil")
                }
                return type
            }
            return .dev
        }
    }
}


enum GlobalSettings{
    static var secretKey:String? {
        get {
            if let rawVal = Bundle.main.infoDictionary?["API_SECRET_KEY"] as? String {
                return rawVal
            }
            return nil
        }
    }
    static var env:BuildEnv {
        get {
            return BuildEnv.current
        }
    }
    
    static var apiKey:String? {
        get {
            let key = "API_KEY"
            
            let keys = ProcessInfo.processInfo.environment
            guard keys.contains(where: { $0.key == key }) else{
                return nil
            }
            guard let value = keys[key] else { return nil }
            return value
            
        }
    }
}
