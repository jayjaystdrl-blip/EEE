#import "UPOverlayView.h"
#import "UPFPSMonitor.h"
#import "UPMemoryMonitor.h"
#import <QuartzCore/QuartzCore.h>


@interface UPOverlayView ()

@property(nonatomic,strong) UILabel *label;
@property(nonatomic,strong) CADisplayLink *displayLink;

@end


@implementation UPOverlayView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if(self)
    {
        self.backgroundColor =
        [UIColor colorWithWhite:0 alpha:0.75];


        self.layer.cornerRadius = 25;


        self.label =
        [[UILabel alloc]
         initWithFrame:self.bounds];


        self.label.textAlignment =
        NSTextAlignmentCenter;


        self.label.textColor =
        UIColor.whiteColor;


        self.label.numberOfLines = 2;


        self.label.font =
        [UIFont boldSystemFontOfSize:13];


        [self addSubview:self.label];


        self.displayLink =
        [CADisplayLink displayLinkWithTarget:self
                                     selector:@selector(updateHUD)];


        [self.displayLink
         addToRunLoop:NSRunLoop.mainRunLoop
         forMode:NSRunLoopCommonModes];
    }

    return self;
}


- (void)updateHUD
{
    self.label.text =
    [NSString stringWithFormat:
     @"FPS: %ld\nRAM: %.0f MB",
     (long)[UPFPSMonitor fps],
     [UPMemoryMonitor memory]];
}


@end
