//
//  Networking.h
//  TableViewTest
//
//  Created by Alexey Tsymlov on 1/22/15.
//  Copyright (c) 2015 Alexey Tsymlov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Networking : NSObject

+ (NSData*) asyncLoadDataFromURL:(NSURL*)url;
+ (NSData*) syncLoadDataFromURL:(NSURL*)url;

@end