//
//  FileDownloader.h
//  011-下载文件
//
//  Created by Peyet-Zhao on 2021/11/8.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileDownloader : NSObject

- (void)download:(NSString *)urlString;
- (void)download:(NSString *)urlString successBlock:(void(^)(NSString *path))success processBlock:(void(^)(float process))processBlock errorBlock:(void(^)(NSError *error))errorBlock;

@end

NS_ASSUME_NONNULL_END
