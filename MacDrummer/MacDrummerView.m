//
//  MacDrummerView.m
//  MacDrummer
//
//  Created by loop on 11/16/12.
//  Copyright (c) 2012 loop. All rights reserved.
//

#import "MacDrummerView.h"
//#include "AUComponent.h"

@implementation MacDrummerView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here
        // We want touch events, all of them!
        [self setAcceptsTouchEvents: YES];
        
    }
    return self;
}

- (void)awakeFromNib {
    // We want them also when we are awaken from Nib, yes!
    [self setAcceptsTouchEvents: YES];
    // [self initializeDefaultOutputAu];
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
}

- (BOOL)acceptsFirstResponder {
    return YES;
}

- (void)mouseDown:(NSEvent *)theEvent {
    NSLog(@"Ricevuto mouseDown! evviva!");
    [super mouseDown:theEvent];
}

- (void)logEvents:(NSEvent *)event: (NSString *)phase {
    NSLog(@"Ricevuto %@ - %@", phase, event);
    NSSet *touches = [event touchesMatchingPhase:NSTouchPhaseBegan inView:self];

    for (NSTouch *touch in touches) {
        /* Once you have a touch, getting the position is dead simple. */
        NSPoint fraction = touch.normalizedPosition;
        CGFloat distance = sqrt(pow((fraction.x - 0.5), 2) +
                                pow((fraction.y - 0.5), 2));
        NSLog(@"%s: Finger is touching %g of center", __func__, distance);
    }
};

- (void)touchesBeganWithEvent:(NSEvent *)event {
    [self logEvents:event : @"began"];
};

- (void)touchesMovedWithEvent:(NSEvent *)event {
    [self logEvents:event : @"moved"];
};

- (void)touchesEndedWithEvent:(NSEvent *)event {
    [self logEvents:event : @"ended"];
};
- (void)touchesCancelledWithEvent:(NSEvent *)event {
    NSLog(@"Ricevuto touchesCancelled - ma anche sti cazzi");
};

@end
