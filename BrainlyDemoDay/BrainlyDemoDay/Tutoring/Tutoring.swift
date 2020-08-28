import Foundation
import UIKit

public enum SessionCompletionStatus {

    case success

    case cancel

    case error

    case reported

    case askCommunity(originalQuestion: TutoringSDKQuestion, updatedQuestion: TutoringSDKQuestion)
}

public enum TutorAvailability {

    case notSupported

    case notAvailable

    case available
}

public protocol TutoringSDKErrorReporting : AnyObject {

    func recordError(_ error: Error)

    func recordError(_ error: Error, userInfo: [String : Any])
}

public protocol TutoringSDKAnalyticsReporting : AnyObject {

    func report(_ event: TutoringSDKEvent)
}

public protocol TutoringSDKEvent {

    var context: String? { get set }

    var location: String? { get set }

    var label: String? { get set }

    var rawParameters: [String : Any]? { get }

    var name: String { get }
}

public struct Event : TutoringSDKEvent {

    public var context: String?

    public var location: String?

    public var label: String?

    public var rawParameters: [String : Any]?

    public var name: String
}

public protocol TutoringSDKDelegate : AnyObject {

    func sessionFinished(sessionCompletionStatus: SessionCompletionStatus)
}

public protocol TutoringProtocol {
    static var shared: Tutoring { get }
    var delegate: TutoringSDKDelegate? { get set }
    static func initialize(configurationUrl: URL, delegate: TutoringSDKDelegate?, errorReporter: TutoringSDKErrorReporting?, analyticsReporter: TutoringSDKAnalyticsReporting?, logLevel: LogLevel) throws
    func login(with userConfig: TutoringSDKUser, completion: @escaping ((Swift.Result<Void, Error>) -> Void))
    func logout()
    func checkTutorAvailability(market: String, subjectId: String, topicId: String?, gradeId: String?, completion: @escaping ((TutorAvailability) -> Void))
    func ask(from viewController: UIViewController, question: TutoringSDKQuestion)
    func sessionHistory(from viewController: UIViewController)
}

public final class Tutoring {

    public static let shared: Tutoring = Tutoring()

    public weak var delegate: TutoringSDKDelegate?

    public static func initialize(configurationUrl: URL,
                                  delegate: TutoringSDKDelegate? = nil,
                                  errorReporter: TutoringSDKErrorReporting? = nil,
                                  analyticsReporter: TutoringSDKAnalyticsReporting? = nil,
                                  logLevel: LogLevel = .disabled) throws {

    }

    public func login(with userConfig: TutoringSDKUser, completion: @escaping ((Swift.Result<Void, Error>) -> Void)) {

    }

    public func logout() {

    }

    public func checkTutorAvailability(market: String, subjectId: String, topicId: String? = nil, gradeId: String? = nil, completion: @escaping ((TutorAvailability) -> Void)) {

    }

    public func ask(from viewController: UIViewController, question: TutoringSDKQuestion) {

    }

    public func sessionHistory(from viewController: UIViewController) {

    }
}

public struct TutoringSDKQuestion {

}

public struct TutoringSDKUser {

}

extension TutoringSDKUser: UserProtoocol {
    public var token: String {
        "ueyryq239048n308tyh0"
    }

    public var market: String {
        "US"
    }
}

public enum LogLevel {
    case disabled
    case enabled
}
