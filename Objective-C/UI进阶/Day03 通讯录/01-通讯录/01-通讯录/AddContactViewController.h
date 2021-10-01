//
//  AddContactViewController.h
//  01-通讯录
//
//  Created by Peyet-Zhao on 2021/10/1.
//  Copyright © 2021 Peyet-Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
@class AddContactViewController;

NS_ASSUME_NONNULL_BEGIN

@protocol AddContactViewControllerDelegate <NSObject>

@optional

- (void)addContactViewController:(AddContactViewController *)addViewController withContact:(Contact *)contact;

@end

@interface AddContactViewController : UIViewController

@property (nonatomic, weak) id<AddContactViewControllerDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
