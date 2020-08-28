import Foundation

public protocol SubscriptionProtocol {
    var name: String { get }
    var ID: Int { get }
    var expirationDate: Date? { get }
    var remainingEntries: Int? { get }
    var subscriptionOption: TutoringSubscriptionOptions { get }
}

public enum TutoringSubscriptionOptions {
    case monthly
    case limitedEntries
}

public enum SubscriptionState {
    case active
    case inactive
}

public final class Subscription<T: SubscriptionProtocol> {
    private let subscription: T

    var name: String { subscription.name }
    var ID: Int { subscription.ID }
    var option: TutoringSubscriptionOptions { subscription.subscriptionOption }
    var isActive: Bool {
        if let expDate = subscription.expirationDate {
            return expDate > Date()
        } else if let entries = subscription.remainingEntries {
            return entries > 0
        }
        fatalError("Subscription must contain either expiry date or remaining entries")
    }

    init(subscription: T) {
        self.subscription = subscription
    }

}

public struct TutoringSubscription: SubscriptionProtocol {
    public var name: String
    public var ID: Int
    public var expirationDate: Date?
    public var remainingEntries: Int?
    public var subscriptionOption: TutoringSubscriptionOptions
}

extension TutoringSubscription {
    static var limitedEntriesSubscription: TutoringSubscription {
        TutoringSubscription(name: "TutoringSubscription", ID: Int.random(in: (0...999)), expirationDate: nil, remainingEntries: 10, subscriptionOption: .limitedEntries)
    }
}
