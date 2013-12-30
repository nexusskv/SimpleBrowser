//
//  CollectViewDataSource.h
//  SimpleBrowser
//
//  Created by rost on 24.12.13.
//  Copyright (c) 2013 rost. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectViewDataSource : NSObject
+ (CollectViewDataSource *)shared;
- (NSArray *)getLinksArray;
@end
