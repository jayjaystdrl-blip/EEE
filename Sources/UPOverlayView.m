#import "UPOverlayView.h"
#import "UPFPSMonitor.h"
#import "UPMemoryMonitor.h"

@interface UPOverlayView ()

@property UILabel *label;

@end


@implementation UPOverlayView


- (instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];

    if(self)
    {
        self.backgroundColor =
        [UIColor colorWithWhite:0 alpha:.65];


        self.layer.cornerRadius = 25;


        self.label =
        [[UILabel alloc]
         initWithFrame:self.bounds];


        self.label.textAlignment =
        NSTextAlignmentCenter;


        self.label.textColor =
        UIColor.whiteColor;


        self.label.font =
        [UIFont boldSystemFontOfSize:13];


        [self addSubview:self.label];


        CADisplayLink *link =
        [CADisplayLink displayLinkWithTarget:self
                                     selector:@selector(update)];


        [link addToRunLoop:
         NSRunLoop.mainRunLoop
         forMode:NSRunLoopCommonModes];
    }

    return self;
}


- (void)update
{
    self.label.text =
    [NSString stringWithFormat:
     @"FPS: %ld\nRAM: %.0f MB",
     (long)[UPFPSMonitor fps],
     [UPMemoryMonitor memory]];
}

@end
