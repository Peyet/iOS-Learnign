//
//  MyNetWorkTools.h
//  016-网易新闻
//
//  Created by Peyet-Zhao on 2021/11/21.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "AFHTTPSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyNetWorkTools : AFHTTPSessionManager

+ (instancetype)sharedNetWorkTools;



@end

NS_ASSUME_NONNULL_END
