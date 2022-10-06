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

#import <SendingnetworkSDK/SendingnetworkSDK.h>

@class MXEvent;

NS_ASSUME_NONNULL_BEGIN

/**
 `MXRoomSyncTimeline` represents the timeline of messages and state changes for a room during server sync.
 */
@interface MXRoomSyncTimeline : MXJSONModel

/**
 List of events (array of MXEvent).
 */
@property (nonatomic) NSArray<MXEvent*> *events;

/**
 Boolean which tells whether there are more events on the server
 */
@property (nonatomic) BOOL limited;

/**
 If the batch was limited then this is a token that can be supplied to the server to retrieve more events
 */
@property (nonatomic) NSString *prevBatch;

@end

NS_ASSUME_NONNULL_END
