//
//  NSString+NSStringExtension.m
//  05QQ聊天
//
//  Created by Peyet-Zhao on 2021/9/20.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "NSString+NSStringExtension.h"



@implementation NSString (NSStringExtension)

- (CGSize)sizeOfTextWithMaxSize:(CGSize)maxSize andFont:(UIFont *)font {
    NSDictionary *dict = @{ NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
}

+ (CGSize)stringWithText:(NSString *)text andMaxSize:(CGSize)maxSize andFont:(UIFont *)font {
    return [text sizeOfTextWithMaxSize:maxSize andFont:font];
}

@end
