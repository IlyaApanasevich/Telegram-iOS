import Foundation

public enum RemoteDateFetcherError: Swift.Error, CustomStringConvertible {
    
    case underlying(error: Swift.Error)
    
    case objectMapping(error: Swift.Error)
    
    case dataNotFound
    
    // MARK: - Description
    public var description: String {
        switch self {
        case .underlying(let error):
            return "Underlying Error :\(error.localizedDescription)"
        case .objectMapping(let error):
            return "Object Mapping Error: \(error.localizedDescription)"
        case .dataNotFound:
            return "Nil Response Data"
        }
    }
}
