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

/// `MXSpaceStore` instances are used to store the spaces related data into a permanent store
protocol MXSpaceStore {
    
    /// Stores the given graph
    /// - Parameters:
    ///   - spaceGraphData: space graph to be stored
    /// - Returns: `true` if the data has been stored properly.`false` otherwise
    func store(spaceGraphData: MXSpaceGraphData) -> Bool
    
    /// Loads graph data from store
    /// - Returns:an instance of `MXSpaceGraphData` if the data has been restored succesfully. `nil` otherwise
    func loadSpaceGraphData() -> MXSpaceGraphData?

}