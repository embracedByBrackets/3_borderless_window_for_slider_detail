//
//  rooDetailView.h
//  3_borderless_window_for_slider_detail
//
//  Created by Brian Cooke on 6/13/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface rooDetailView : NSView {

}

// the slider will call this and we'll move our window
- (IBAction) sliderMoved:(id)sender;

@end
