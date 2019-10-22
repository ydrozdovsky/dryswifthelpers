//
// Created by Yuri Drozdovsky on 2019-07-25.
// Copyright (c) 2019 drozdovsky. All rights reserved.
//

import Foundation

public enum DRYSwiftHelpersError: Error {
    case semaphoreTimedOut
    case httpInvalidResponse
    case httpBadStatusCode(statusCode: Int, data: Data?)
    case operationCancelled

    public var description: String {
        switch self {
        case .httpBadStatusCode(let statusCode, let data):
            if data != nil, let errorString = String(data: data!, encoding: .utf8) {
                return "httpBadStatusCode(statusCode: \(statusCode), data: '\(errorString)'"
            }
            fallthrough
        default:
            return String(describing: self)
        }
    }
}
