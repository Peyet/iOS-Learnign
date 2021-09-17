//
//  NSString+NSStringExtension.h
//  01-QQ聊天界面
//
//  Created by Peyet-Zhao on 2021/9/17.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (NSStringExtension)

- (CGSize)sizeOfTextWithMaxSize:(CGSize)maxSize font:(UIFont *)font;

+ (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
