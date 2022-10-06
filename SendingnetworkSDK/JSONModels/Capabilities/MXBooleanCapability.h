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
#import <SendingnetworkSDK/SendingnetworkSDK.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Capability model for only `{"enabled": true | false}` JSON model.
 */
@interface MXBooleanCapability : MXJSONModel<NSCoding>

/**
 Flag indicating that the capability is enabled or not.
 */
@property (nonatomic, readonly, getter=isEnabled) BOOL enabled;

@end

NS_ASSUME_NONNULL_END
