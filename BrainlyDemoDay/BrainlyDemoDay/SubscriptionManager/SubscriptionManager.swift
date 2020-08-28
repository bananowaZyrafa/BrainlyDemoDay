import Foundation

public enum SubscriptionState {
    case monthly(Date)
    case limitedEntries(Int)
    case empty
}

public protocol SubscriptionManagerProtocol {
    func fetchSubscriptionFor(tutoringUser user: TutoringSDKUser, completion: @escaping (Swift.Result<SubscriptionState, Error>) -> Void)
}

public protocol Networking {

}

public final class SubscriptionManager: SubscriptionManagerProtocol {

    private let networkManager: Networking

    init(networkManager: Networking) {
        self.networkManager = networkManager
    }

    public func fetchSubscriptionFor(tutoringUser user: TutoringSDKUser, completion: @escaping (Swift.Result<SubscriptionState, Error>) -> Void) {
        //fetch using network manager
        let error = Bool.random()
        if error {
            let errorToReturn = NSError(domain: "Subscription request error", code: 999, userInfo: nil)
            completion(.failure(errorToReturn))
        } else {
            completion(.success(.monthly(futureDate)))
        }
    }
}

private extension SubscriptionManager {
    var futureDate: Date {
        let currentDate = Date()
        var dateComponent = DateComponents()
        dateComponent.day = 5
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
        return futureDate ?? Date()
    }
}
