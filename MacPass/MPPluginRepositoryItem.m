//
//  MPPluginRepositoryItem.m
//  MacPass
//
//  Created by Michael Starke on 08.03.18.
//  Copyright © 2018 HicknHack Software GmbH. All rights reserved.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

#import "MPPluginRepositoryItem.h"


NSString *const MPPluginItemNameKey = @"name";
NSString *const MPPluginItemDescriptionKey = @"description";
NSString *const MPPluginItemDownloadURLKey = @"download";
NSString *const MPPluginItemSourceURLKey = @"source";
NSString *const MPPluginItemCurrentVersionKey = @"currentVersion";
NSString *const MPPluginItemBundleIdentifierKey = @"bundleIdentifier";

@interface MPPluginRepositoryItem ()

@property (copy) NSString *name;
@property (copy) NSString *currentVersion;
@property (copy) NSString *descriptionText;
@property (copy) NSURL *sourceURL;
@property (copy) NSURL *downloadURL;
@property (copy) NSURL *bundleIdentifier;

@end

@implementation MPPluginRepositoryItem

@dynamic valid;

+ (instancetype)pluginItemFromDictionary:(NSDictionary *)dict {
  return [[MPPluginRepositoryItem alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
  self = [super init];
  if(self) {
    self.name = dict[MPPluginItemNameKey];
    self.descriptionText = dict[MPPluginItemDescriptionKey];
    self.downloadURL = [NSURL URLWithString:dict[MPPluginItemDownloadURLKey]];
    self.sourceURL = [NSURL URLWithString:dict[MPPluginItemSourceURLKey]];
    self.currentVersion = dict[MPPluginItemCurrentVersionKey];
    self.bundleIdentifier = dict[MPPluginItemBundleIdentifierKey];
  }
  return self;
}

- (BOOL)isVaid {
  /* name and download seems ok */
  return (self.name.length > 0 && self.downloadURL);
}

@end
