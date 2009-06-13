//
//  Controller.h
//  3_borderless_window_for_slider_detail
//

#import <Cocoa/Cocoa.h>


@interface Controller : NSObject {
    NSNumber *_myValue;
    
    IBOutlet NSView *detailView;
}

@property (nonatomic, retain) NSNumber *myValue;

@end
