//
//  Error.swift
//  teste-afya
//
//  Created by Magna on 06/05/21.
//
import Foundation

/// The `Error` struct provides a convenience for creating custom Disciplo NSErrors.
public struct Error {
    /// The domain used for creating all errors.
    public static let Domain = "com.diario.error"

    /// The custom error codes.
    public enum Code: Int {
        case contentTypeValidationFailed  = -6002
        case statusCodeValidationFailed   = -6003
        case dataSerializationFailed      = -6004
        case jsonSerializationFailed      = -6006
    }

    /// The server error codes.
    public enum ServerCode: Int {
        case accessdenied                 = 100
        case accessErrorUnknown           = 101

        case success                      = 200
        case validation                   = 201
        case unknown                      = 202
        case redirect                     = 203

        // Authorization endpoints error codes
        case authErrorMissingCredentials  = 300
        case authErrorInactiveUser        = 301
        case authErrorWrongCredentials    = 302
        case authErrorTokenInvalid        = 303
        case signUpErrorUserExists        = 304
        case recoverErrorNotExists        = 305
        case recoverCodeErrorNotExists    = 306
        case inviteCodeErrorNotExists     = 307

        // Business logic custom errors
        case groupErrorUnknownGroup       = 400
        case userErrorEmailExists         = 401
        case postAlreadyShared            = 402
        case invalidFile                  = 403
        case invalidImageSize             = 404
        case twitterUserNotFound          = 405
        case twitterAccessDenied          = 406
        case categoryErrorUnknownCategory = 407
        case categoryUsed                 = 408
        case groupErrorInviteExists       = 409
        case groupErrorPostInGroup        = 410
        case groupErrorUserInGroup        = 411
        case twitterTooManyRequests       = 412
        case facebookImportError          = 413
        case postApprovalWaiting          = 414
        case postApprovalApproved         = 415
        case postApprovalRejected         = 416
        case invalidPostQueueSettings     = 417
        case deferredShareNetworkNotLinked       = 418
        case deferredSharePostAlreadyDeferred    = 419
        case mailchimpScheduleTimeTooEarly       = 420
        case userBulkUploadGoingAsync            = 421
        case socialAuthStatusActive              = 422
        case socialAuthStatusInactive            = 423
        case socialAuthStatusWaitingVerification = 424
        case apiRateLimitExceeded                = 425
        case authMagicLinkExpired                = 426
        case authMagicLinkIncorrect              = 427
        case authMagicLinkUsed                   = 428
        case ssoOrganizationIdOrDomainNotFound   = 429

        // Inbox folder
        case inboxFolderNameExistsOrEmpty        = 450
        case inboxFolderIdDoesntExistOrDeleted   = 451
        case inboxFolderInvalidSortOrderDatcase  = 452
        case inboxSubscriptionLimitReached       = 453

        // Reader
        case readerModuleUrlNotReady = 600
    }

    /// Custom keys contained within certain NSError `userInfo` dictionaries
    public struct UserInfoKeys {
        /// The content type user info key for a `.ContentTypeValidationFailed` error stored as a `String` value.
        public static let ContentType = "ContentType"

        /// The status code user info key for a `.StatusCodeValidationFailed` error stored as an `Int` value.
        public static let StatusCode = "StatusCode"
    }

    public static func error(domain: String = Error.Domain, code: Code, failureReason: String) -> NSError {
        return error(domain: domain, code: code.rawValue, failureReason: failureReason)
    }

    public static func error(domain: String = Error.Domain, code: Int, failureReason: String) -> NSError {
        let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
        return NSError(domain: domain, code: code, userInfo: userInfo)
    }
}
