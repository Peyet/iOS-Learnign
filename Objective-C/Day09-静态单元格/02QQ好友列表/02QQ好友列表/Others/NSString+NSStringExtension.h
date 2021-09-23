//
//  NSString+NSStringExtension.h
//  02QQ好友列表
//
//  Created by Peyet-Zhao on 2021/9/20.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSString (NSStringExtension)

- (CGSize)sizeOfStringWithMaxSize:(CGSize)maxSize andFont:(UIFont *)font;

+ (CGSize)sizeOfString:(NSString *)text andMaxSize:(CGSize)maxsize andFont:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
