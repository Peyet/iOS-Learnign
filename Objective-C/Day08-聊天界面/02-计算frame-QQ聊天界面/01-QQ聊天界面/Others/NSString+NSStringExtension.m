//
//  NSString+NSStringExtension.m
//  01-QQ聊天界面
//
//  Created by Peyet-Zhao on 2021/9/17.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "NSString+NSStringExtension.h"
#import <UIKit/UIKit.h>


@implementation NSString (NSStringExtension)

- (CGSize)sizeOfTextWithMaxSize:(CGSize)maxSize font:(UIFont *)font {
    NSDictionary *dict = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
}

+ (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font {
    return [text sizeOfTextWithMaxSize:maxSize font:font];
}

@end
