//
//  UIImageView+MyImageView.m
//  06-关联对象
//
//  Created by Peyet-Zhao on 2021/10/22.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import "UIImageView+MyImageView.h"
#import <objc/runtime.h>

@implementation UIImageView (MyImageView)
    
- (NSString *)urlString {
    return objc_getAssociatedObject(self, "urlString");
}

- (void)setUrlString:(NSString *)urlString {
    objc_setAssociatedObject(self, "urlString", urlString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
