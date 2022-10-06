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

#import <Foundation/Foundation.h>

#import "MXSecretStorageKeyContent.h"

NS_ASSUME_NONNULL_BEGIN

/**
 Data returned by `[MXSecretStorageManager createKeyWithKeyId:]`.
 */
@interface MXSecretStorageKeyCreationInfo : NSObject

@property (nonatomic) NSString *keyId;

@property (nonatomic) MXSecretStorageKeyContent *content;

@property (nonatomic) NSData *privateKey;
@property (nonatomic) NSString *recoveryKey;

@end

NS_ASSUME_NONNULL_END
