import Foundation

public protocol SubscriptionManagerProtocol {
    func fetchSubscriptionFor(user: UserProtoocol, completion: @escaping (Swift.Result<Subscription<TutoringSubscription>, Error>) -> Void)
}

public protocol Networking {

}

public protocol UserProtoocol {
    var token: String { get }
    var market: String { get }
}

public final class SubscriptionManager: SubscriptionManagerProtocol {

    private let networkManager: Networking

    init(networkManager: Networking) {
        self.networkManager = networkManager
    }

    public func fetchSubscriptionFor(user: UserProtoocol, completion: @escaping (Swift.Result<Subscription<TutoringSubscription>, Error>) -> Void) {
        //fetch using network manager
        let error = Bool.random()
        if error {
            let errorToReturn = NSError(domain: "Subscription request error", code: 999, userInfo: nil)
            completion(.failure(errorToReturn))
        } else {
            completion(.success(Subscription(subscription: TutoringSubscription.limitedEntriesSubscription)))
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
