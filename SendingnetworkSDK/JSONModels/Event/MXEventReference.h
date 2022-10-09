/*
 Copyright 2019 The Matrix.org Foundation C.I.C

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

#import "MXJSONModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface MXEventReference : MXJSONModel

/**
 Event id.
 */
@property (nonatomic, readonly) NSString *eventId;

/**
 Event type.

 TODO: Remove nullable once Synapse respects MSC1849.
 */
@property (nonatomic, readonly, nullable) NSString *type;


- (instancetype)initWithEventId:(NSString *)eventId type:(nullable NSString *)type;

@end

NS_ASSUME_NONNULL_END
