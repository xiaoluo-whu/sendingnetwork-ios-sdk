/*
 Copyright 2020 The Sending.network Foundation C.I.C
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MXQRCodeData.h"

NS_ASSUME_NONNULL_BEGIN

@interface MXSelfVerifyingMasterKeyNotTrustedQRCodeData : MXQRCodeData

// then the current device's device key
@property (nonatomic, strong, readonly, nullable) NSString *currentDeviceKey;

// what the device thinks the user's master cross-signing key is
@property (nonatomic, strong, readonly, nullable) NSString *userCrossSigningMasterKeyPublic;

@end

NS_ASSUME_NONNULL_END