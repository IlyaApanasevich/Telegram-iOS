import Foundation

public protocol FetchableDateItem {
    
    var datetime: String { get }
    
    var unixtime: Int { get }
    
    var utcDatetime: String { get }
}
