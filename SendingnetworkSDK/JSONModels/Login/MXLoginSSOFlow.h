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

#import <Foundation/Foundation.h>
#import "MXJSONModels.h"
#import "MXLoginSSOIdentityProvider.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString *const MXLoginSSOFlowIdentityProvidersKey;

/**
 `MXLoginSSOFlow` represents a SSO login or a register flow supported by the home server (See MSC2858 https://github.com/sending-network/sendingnetwork-doc/pull/2858).
 */
@interface MXLoginSSOFlow : MXLoginFlow

/**
 List of all SSO Identity Providers supported
 */
@property (nonatomic, readonly) NSArray<MXLoginSSOIdentityProvider*> *identityProviders;

@end

NS_ASSUME_NONNULL_END