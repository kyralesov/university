//
//  UIView+EKUniversity.m
//  university
//
//  Created by Yura on 11.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//

#import "UIView+EKUniversity.h"

@implementation UIView (EKUniversity)

- (UITableViewCell *)superCell {
    
    if ([self isKindOfClass:[UITableViewCell class]]) {
        return (UITableViewCell *)self;
    }
    
    if (!self.superview) {
        return nil;
    }
    
    return [self.superview superCell];
}


- (void) firstTextFieldBecomeFirstResponder {
    
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UITextField class]]) {
            [(UITextField *)view becomeFirstResponder];
            return;
        } else {
            [view firstTextFieldBecomeFirstResponder];
        }
    }
}

- (void) setTextFieldEnabled:(BOOL) enabled {
    
        for (UIView *subview in self.subviews)
        {
            if ([subview isKindOfClass:[UITextField class]]) {
                [(UITextField *)subview setEnabled:enabled];
            } else {
                [subview setTextFieldEnabled:enabled];
            }
        }
    }

@end
