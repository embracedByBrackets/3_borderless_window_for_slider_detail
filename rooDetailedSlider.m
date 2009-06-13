//
//  rooDetailedSlider.m
//  3_borderless_window_for_slider_detail
//

#import "rooDetailedSlider.h"


@implementation rooDetailedSlider

- (void) mouseDown:(NSEvent *)theEvent
{
    //
    // the super implementation runs its own event loop
    // so we display the child window before calling super
    // and then hide and clean it up when that returns
    //
    // not sure it's healthy to use this knowledge
    // 
    // anyone know better way?
    //
    
    
    // display the child window under the mouse
    NSPoint thePoint = [[self window] convertBaseToScreen:[theEvent locationInWindow]];
    
    // we need to display the window on the Y axis relative to the slider, not the mouse
    NSPoint sliderPoint = [[self window] convertBaseToScreen:[self frame].origin];
    thePoint.y = sliderPoint.y+5;
    
    NSWindow *childWindow;
    NSRect r = NSMakeRect(thePoint.x - ([detailView frame].size.width/2), thePoint.y-[detailView frame].size.height, [detailView frame].size.width, [detailView frame].size.height);
    childWindow = [[NSWindow alloc] initWithContentRect:r styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer:NO];
    [childWindow setHasShadow:NO];
    [childWindow setOpaque:NO];
    [childWindow setBackgroundColor:[NSColor clearColor]];
    [childWindow setContentView:detailView];
    
    [[self window] addChildWindow:childWindow ordered:NSWindowAbove]; 
    
    
    // let super do it's thing
    [super mouseDown:theEvent];
    
    
    // hide the detail window
    [[self window] removeChildWindow:childWindow];
    [childWindow close];

}

@end
