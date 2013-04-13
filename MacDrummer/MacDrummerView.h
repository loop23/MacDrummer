//
//  MacDrummerView.h
//  MacDrummer
//
//  Created by loop on 11/16/12.
//  Copyright (c) 2012 loop. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MacDrummerView : NSView

- (void)logEvents:(NSEvent *)event: (NSString *)phase;

@end
