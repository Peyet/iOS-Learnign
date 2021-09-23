//
//  NSString+NSStringExtension.m
//  02QQ好友列表
//
//  Created by Peyet-Zhao on 2021/9/20.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "NSString+NSStringExtension.h"



@implementation NSString (NSStringExtension)

- (CGSize)sizeOfStringWithMaxSize:(CGSize)maxSize andFont:(UIFont *)font {
    NSDictionary *attr = @{NSFontAttributeName : font};
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

+ (CGSize)sizeOfString:(NSString *)text andMaxSize:(CGSize)maxsize andFont:(UIFont *)font {
    return [text sizeOfStringWithMaxSize:maxsize andFont:font];
}

@end
