//
//  SDTestLoader.m
//  Test
//
//  Created by 刘泽锋 on 2022/5/27.
//

#import "SDTestLoader.h"
#import "AFNetworking.h"

@implementation SDTestLoader

- (void)getData{
//    NSURL *url = [NSURL URLWithString:@"https://zefey.com/api/blog"];
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"completionHandler");
//    }];
//
//    [dataTask resume];
    
    [[AFHTTPSessionManager manager] GET:@"https://zefey.com/api/blog" parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"progress");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure");
    }];
    
}

@end
