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

#import "MXAesKeyData.h"

@interface MXAesKeyData()

@property (nonatomic, strong) NSData *iv;

@property (nonatomic, strong) NSData *key;

@end

@implementation MXAesKeyData

+ (MXAesKeyData *) dataWithIv: (NSData *)iv key: (NSData *)key
{
    return [[MXAesKeyData alloc] initWithIv:iv key:key];
}

- (instancetype) initWithIv: (NSData *)iv key: (NSData *)key
{
    self = [super init];
    
    if (self)
    {
        self.iv = iv;
        self.key = key;
    }
    
    return self;
}

- (MXKeyType)type
{
    return kAes;
}

@end