// 
// Copyright 2021 The Sending.network Foundation C.I.C
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation

internal extension Array {
    
    /// Split an array into smaller chunks.
    ///
    /// https://www.hackingwithswift.com/example-code/language/how-to-split-an-array-into-chunks
    ///
    /// - Parameter size: max size of splitted arrays
    /// - Returns: an array of splitted arrays
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
