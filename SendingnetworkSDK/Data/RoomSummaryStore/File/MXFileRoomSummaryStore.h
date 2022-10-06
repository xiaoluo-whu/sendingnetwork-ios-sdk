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

#import <Foundation/Foundation.h>
#import "MXMemoryRoomSummaryStore.h"
#import "MXCredentials.h"

NS_ASSUME_NONNULL_BEGIN

/**
 `MXFileRoomSummaryStore` extends `MXMemoryRoomSummaryStore` by adding permanent storage..
 
 The files structure is the following:
 + NSCachesDirectory
    + MXFileRoomSummaryStore
        + Sendingnetwork user id (one folder per account)
            + {roomId1}
            + {roomId2}
            + ...
 */
@interface MXFileRoomSummaryStore : MXMemoryRoomSummaryStore

/**
 Initializer.
 
 @param credentials user credentials.
 */
- (instancetype)initWithCredentials:(MXCredentials *)credentials;

@end

NS_ASSUME_NONNULL_END
