//
//  Crypto.swift
//  OneTimePassword
//
//  Copyright (c) 2016-2018 Matt Rubin and the OneTimePassword authors
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
import CryptoKit

func HMAC(algorithm: Generator.Algorithm, key: Data, data: Data) -> Data {
    let key = SymmetricKey(data: key)

    switch algorithm {
    case .sha1:
        return Data(CryptoKit.HMAC<Insecure.SHA1>.authenticationCode(for: data, using: key))
    case .sha256:
        return Data(CryptoKit.HMAC<SHA256>.authenticationCode(for: data, using: key))
    case .sha512:
        return Data(CryptoKit.HMAC<SHA512>.authenticationCode(for: data, using: key))
    }
}
