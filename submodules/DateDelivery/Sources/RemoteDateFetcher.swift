import Foundation
import SwiftSignalKit

public final class RemoteDateFetcher {
    
    public init() {}
    
    // MARK: - Fetch
    public func fetchDate() -> Signal<FetchableDateItem, RemoteDateFetcherError> {
        return Signal { subscriber in
            let url = URL(string: "http://worldtimeapi.org/api/timezone/Europe/Moscow")!
            
            let urlRequest = URLRequest(url: url)
            let session = URLSession.shared
            
            let task = session.dataTask(with: urlRequest) { (data, response, error) in
                guard error == nil else {
                    return subscriber.putError(.underlying(error: error!))
                }
                
                guard let data = data else {
                    return subscriber.putError(.dataNotFound)
                }
                
                let decoder = JSONDecoder()
                
                do {
                    let model = try decoder.decode(RemoteDateResponseModel.self, from: data)
                    subscriber.putNext(model)
                    subscriber.putCompletion()
                    
                } catch {
                    subscriber.putError(.objectMapping(error: error))
                }
                
            }
            task.resume()
                    
            return ActionDisposable {
                task.cancel()
            }
        }
    }
}
