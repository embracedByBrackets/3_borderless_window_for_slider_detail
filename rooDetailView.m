//
//  rooDetailView.m
//  3_borderless_window_for_slider_detail
//
//  Created by Brian Cooke on 6/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "rooDetailView.h"


@implementation rooDetailView

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (IBAction) sliderMoved:(id)sender
{
    // move the child window X position to match where the mouse is
    // It's pretty odd to be doing this here.
    NSRect frame = [[self window] frame];
    frame.origin.x = [NSEvent mouseLocation].x - (frame.size.width/2);
    
    [[self window] setFrame:frame display:YES];    
}

- (void)drawRect:(NSRect)rect {
    NSRect roundedRect = rect;
    roundedRect.size.height -= 15;
    
    // draw the rounded rect
    NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:roundedRect xRadius:5.0 yRadius:5.0];
    NSColor *trans = [NSColor colorWithCalibratedRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    [trans setStroke];
    [trans setFill];
    [path stroke];
    [path fill];
    
    // draw the little arrow pointing up.
    path = [NSBezierPath bezierPath];
    NSPoint startingPoint = NSMakePoint(roundedRect.origin.x + (roundedRect.size.width/2)-5, roundedRect.origin.y + roundedRect.size.height);
    [path moveToPoint:startingPoint];
    [path lineToPoint:NSMakePoint(startingPoint.x+5, startingPoint.y+5)];
    [path lineToPoint:NSMakePoint(startingPoint.x+10, startingPoint.y)];
    [path closePath];
    [path fill];
}

@end
