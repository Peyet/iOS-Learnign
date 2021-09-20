//
//  NSString+NSStringExtension.h
//  05QQ聊天
//
//  Created by Peyet-Zhao on 2021/9/20.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//



#import <Foundation/Foundation.h>
#import <CoreML/CoreML.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (NSStringExtension)


- (CGSize)sizeOfTextWithMaxSize:(CGSize)maxSize andFont:(UIFont *)font;

+ (CGSize)stringWithText:(NSString *)text andMaxSize:(CGSize)maxSize andFont:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
