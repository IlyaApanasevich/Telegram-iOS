import Foundation

public struct RemoteDateResponseModel: Decodable, FetchableDateItem {
    
    // MARK: - Public Properties
    public var abbreviation: String
    public var datetime: String
    public var dayOfWeek, dayOfYear: Int
    public var timezone: String
    public var unixtime: Int
    public var utcDatetime: String
    public var utcOffset: String

    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case abbreviation
        case datetime
        case dayOfWeek = "day_of_week"
        case dayOfYear = "day_of_year"
        case timezone, unixtime
        case utcDatetime = "utc_datetime"
        case utcOffset = "utc_offset"
    }
}
