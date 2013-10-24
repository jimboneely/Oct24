//
//  Oct24AppDelegate.h
//  Oct24
//
//  Created by James Neely on 10/24/13.
//  Copyright (c) 2013 James Neely. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface Oct24AppDelegate : UIResponder <UIApplicationDelegate> {
    View *view;
    UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
