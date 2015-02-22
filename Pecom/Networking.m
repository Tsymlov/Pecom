//
//  Networking.m
//  TableViewTest
//
//  Created by Alexey Tsymlov on 1/22/15.
//  Copyright (c) 2015 Alexey Tsymlov. All rights reserved.
//

#import "Networking.h"

@implementation Networking

+ (NSData*) asyncLoadDataFromURL:(NSURL*)url{
    __block NSData* result = nil;
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url
                                                cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                            timeoutInterval:30.0f];
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:urlRequest
                                       queue:queue
                           completionHandler:^(NSURLResponse *reponse,
                                               NSData *data,
                                               NSError *error){
                               if(error == nil){
                                   result = data;
                               }
                               else{
                                   NSLog(@"Error happened during loading = %@", error);
                               }
                           }];
    return result;
}

+ (NSData*) syncLoadDataFromURL:(NSURL*)url{
    NSData *result = nil;
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSError *error = nil;
    
    result = [NSURLConnection sendSynchronousRequest:urlRequest
                                   returningResponse:nil
                                               error:&error];
    
    if (error != nil) {
        NSLog(@"Error happened during loading = %@", error);
    }
    return result;
}
@end