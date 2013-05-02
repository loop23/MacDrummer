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
        // Initialize OSCManager
        manager = [[OSCManager alloc] init];
        [manager setDelegate:self];

        // create an input port for receiving OSC data
        //[manager createNewInputForPort:1234];

        // create an output so i can send OSC data to myself
        outPort = [manager createNewOutputToAddress:@"127.0.0.1" atPort:1234];
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

- (void)logEvents:(NSEvent *)theEvent
                 :(NSString *)phase {
    //NSLog(@"Ricevuto %@ - %@", phase, theEvent);
    NSSet *touches = [theEvent touchesMatchingPhase:NSTouchPhaseBegan inView:self];
    OSCMessage *newMsg;

    for (NSTouch *touch in touches) {
        CGFloat distance = [self distanceFromCenter:touch];
        NSLog(@"%s: Finger is touching %g of center", __func__, distance);
        // Should do the actual sound!
        // make an OSC message
        newMsg = [OSCMessage createWithAddress:@"/MacDrummer/DrumHit/1"];

        // add a bunch arguments to the message
        [newMsg addFloat:distance];
        // send the OSC message
        [outPort sendThisMessage:newMsg];
    }
}

- (CGFloat)distanceFromCenter:(NSTouch *)touch
{
    /* Once you have a touch, getting the position is dead simple. */
    NSPoint fraction = touch.normalizedPosition;
    return sqrt(pow((fraction.x - 0.5), 2) +
                pow((fraction.y - 0.5), 2));
}

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
