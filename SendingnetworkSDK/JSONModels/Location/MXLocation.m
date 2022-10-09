// 
// Copyright 2022 The Matrix.org Foundation C.I.C
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

#import "MXLocation.h"
#import "MXEvent.h"
#import "SendingnetworkSDKSwiftHeader.h"

@implementation MXLocation

#pragma mark - Setup

- (instancetype)initWithLatitude:(double)latitude longitude:(double)longitude description:(NSString *)description
{
    if (self = [super init])
    {
        MXGeoURIComponents *geoURIComponents = [[MXGeoURIComponents alloc] initWithLatitude:latitude longitude:longitude];
        
        _latitude = latitude;
        _longitude = longitude;
        _desc = description;
        _geoURI = geoURIComponents.geoURI;
    }
    
    return self;
}

#pragma mark - Overrides

+ (instancetype)modelFromJSON:(NSDictionary *)JSONDictionary
{
    NSString *geoURIString;
    NSString *description;
    
    MXJSONModelSetString(geoURIString, JSONDictionary[kMXMessageContentKeyExtensibleLocationURI]);
    MXJSONModelSetString(description, JSONDictionary[kMXMessageContentKeyExtensibleLocationDescription]);
    
    if (!geoURIString)
    {
        return nil;
    }
    
    MXGeoURIComponents *geoURIComponents = [[MXGeoURIComponents alloc] initWithGeoURI:geoURIString];
    
    if (!geoURIComponents)
    {
        return nil;
    }
    
    return [[[self class] alloc] initWithLatitude:geoURIComponents.latitude
                                        longitude:geoURIComponents.longitude
                                      description:description];
}

- (NSDictionary *)JSONDictionary
{
    NSMutableDictionary *content = [NSMutableDictionary dictionary];
        
    content[kMXMessageContentKeyExtensibleLocationURI] = self.geoURI;

    if (self.desc)
    {
        content[kMXMessageContentKeyExtensibleLocationDescription] = self.desc;
    }

    return content;
}

@end
