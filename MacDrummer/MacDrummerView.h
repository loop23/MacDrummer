//
//  MacDrummerView.h
//  MacDrummer
//
//  Created by loop on 11/16/12.
//  Copyright (c) 2012 loop. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <VVOSC/OSCManager.h>

@interface MacDrummerView : NSView {
    OSCManager *manager;
    OSCOutPort *outPort;
}

- (void)logEvents:(NSEvent *)theEvent :(NSString *)phase;
- (CGFloat)distanceFromCenter:(NSTouch *)touch;
@end
