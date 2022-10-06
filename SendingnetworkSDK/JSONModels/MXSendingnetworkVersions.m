/*
 Copyright 2018 New Vector Ltd

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

#import "MXSendingnetworkVersions.h"

const struct MXSendingnetworkClientServerAPIVersionStruct MXSendingnetworkClientServerAPIVersion = {
    .r0_0_1 = @"r0.0.1",
    .r0_1_0 = @"r0.1.0",
    .r0_2_0 = @"r0.2.0",
    .r0_3_0 = @"r0.3.0",
    .r0_4_0 = @"r0.4.0",
    .r0_5_0 = @"r0.5.0",
    .r0_6_0 = @"r0.6.0",
    .r0_6_1 = @"r0.6.1",
    .v1_1   = @"v1.1",
    .v1_2   = @"v1.2",
    .v1_3   = @"v1.3"
};

const struct MXSendingnetworkVersionsFeatureStruct MXSendingnetworkVersionsFeature = {
    .lazyLoadMembers = @"m.lazy_load_members",
    .requireIdentityServer = @"m.require_identity_server",
    .idAccessToken = @"m.id_access_token",
    .separateAddAndBind = @"m.separate_add_and_bind"
};

static NSString* const kJSONKeyVersions = @"versions";
static NSString* const kJSONKeyUnstableFeatures = @"unstable_features";

//  Unstable features
static NSString* const kJSONKeyMSC3440 = @"org.sendingnetwork.msc3440.stable";

@interface MXSendingnetworkVersions ()

@property (nonatomic, readwrite) NSArray<NSString *> *versions;
@property (nonatomic, nullable, readwrite) NSDictionary<NSString*, NSNumber*> *unstableFeatures;

@end

@implementation MXSendingnetworkVersions

+ (id)modelFromJSON:(NSDictionary *)JSONDictionary
{
    if (JSONDictionary[kJSONKeyVersions])
    {
        MXSendingnetworkVersions *result = [MXSendingnetworkVersions new];

        MXJSONModelSetArray(result.versions, JSONDictionary[kJSONKeyVersions]);
        MXJSONModelSetDictionary(result.unstableFeatures, JSONDictionary[kJSONKeyUnstableFeatures]);

        return result;
    }
    return nil;
}

- (NSDictionary *)JSONDictionary
{
    NSMutableDictionary *JSONDictionary = [NSMutableDictionary dictionary];

    JSONDictionary[kJSONKeyVersions] = self.versions;

    if (self.unstableFeatures)
    {
        JSONDictionary[kJSONKeyUnstableFeatures] = self.unstableFeatures;
    }

    return JSONDictionary;
}

- (BOOL)supportLazyLoadMembers
{
    return [self serverSupportsVersion:MXSendingnetworkClientServerAPIVersion.r0_5_0]
    || [self serverSupportsFeature:MXSendingnetworkVersionsFeature.lazyLoadMembers];
}

- (BOOL)doesServerRequireIdentityServerParam
{
    if ([self serverSupportsVersion:MXSendingnetworkClientServerAPIVersion.r0_6_0])
    {
        return NO;
    }

    return [self serverSupportsFeature:MXSendingnetworkVersionsFeature.requireIdentityServer
                          defaultValue:YES];
}

- (BOOL)doesServerAcceptIdentityAccessToken
{
    return [self serverSupportsVersion:MXSendingnetworkClientServerAPIVersion.r0_6_0]
    || [self serverSupportsFeature:MXSendingnetworkVersionsFeature.idAccessToken];
}

- (BOOL)doesServerSupportSeparateAddAndBind
{
    return [self serverSupportsVersion:MXSendingnetworkClientServerAPIVersion.r0_6_0]
    || [self serverSupportsFeature:MXSendingnetworkVersionsFeature.separateAddAndBind];
}

- (BOOL)supportsThreads
{
    // TODO: Check for v1.3 or whichever spec version formally specifies MSC3440.
    return [self serverSupportsFeature:kJSONKeyMSC3440];
}

#pragma mark - Private

- (BOOL)serverSupportsVersion:(NSString *)version
{
    //  we might improve this logic in future, so moved into a dedicated method.
    return [self.versions containsObject:version];
}

- (BOOL)serverSupportsFeature:(NSString *)feature
{
    return [self serverSupportsFeature:feature defaultValue:NO];
}

- (BOOL)serverSupportsFeature:(NSString *)feature defaultValue:(BOOL)defaultValue
{
    if (self.unstableFeatures[feature])
    {
        return self.unstableFeatures[feature].boolValue;
    }
    return defaultValue;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        self.versions = [aDecoder decodeObjectForKey:kJSONKeyVersions];
        self.unstableFeatures = [aDecoder decodeObjectForKey:kJSONKeyUnstableFeatures];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.versions forKey:kJSONKeyVersions];
    [aCoder encodeObject:self.unstableFeatures forKey:kJSONKeyUnstableFeatures];
}

@end
