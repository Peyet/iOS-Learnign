//
//  EditingViewController.h
//  01-通讯录
//
//  Created by Peyet-Zhao on 2021/10/1.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
@class EditingViewController;

NS_ASSUME_NONNULL_BEGIN

@protocol EditingViewControllerDelegate <NSObject>

@required
- (void)editingViewControllerDelegate:(EditingViewController *)editinngViewController;
@end

@interface EditingViewController : UIViewController

@property (nonatomic, strong) Contact *contact;

@property (nonatomic, weak) id<EditingViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
