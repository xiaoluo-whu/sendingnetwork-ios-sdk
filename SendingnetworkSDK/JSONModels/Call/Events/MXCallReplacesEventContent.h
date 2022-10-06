// 
// Copyright 2020 The Sending.network Foundation C.I.C
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

#import "MXCallEventContent.h"

NS_ASSUME_NONNULL_BEGIN

@class MXUserModel;

/**
 `MXCallReplacesEventContent` represents the content of an `m.call.replaces` event.
 */
@interface MXCallReplacesEventContent : MXCallEventContent

/**
 An identifier for the call replacement itself, generated by the transferor.
 */
@property (nonatomic) NSString *replacementId;

/**
 The time in milliseconds that the transfer request is valid for.
 Once the request age exceeds this value, clients should discard it.
 */
@property (nonatomic) NSUInteger lifetime;

/**
 Optional. If specified, the transferee client waits for an invite to this room and joins it and then continues the transfer in this room. If absent, the transferee contacts the Sendingnetwork User ID given in the `targetUser` field in a room of its choosing.
 */
@property (nonatomic, nullable) NSString *targetRoomId;

/**
 An object giving information about the transfer target.
 */
@property (nonatomic, nullable) MXUserModel *targetUser;

/**
 If specified, gives the call ID for the transferee's client to use when placing the replacement call. Mutually exclusive with `awaitCallId`.
 */
@property (nonatomic, nullable) NSString *createCallId;

/**
 If specified, gives the call ID that the transferee's client should wait for. Mutually exclusive with `createCallId`.
 */
@property (nonatomic, nullable) NSString *awaitCallId;

@end

NS_ASSUME_NONNULL_END
