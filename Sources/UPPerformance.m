#import "UPPerformance.h"
#import "UPOverlayView.h"

@implementation UPPerformance

+ (instancetype)shared
{
    static UPPerformance *instance;
    static dispatch_once_t once;

    dispatch_once(&once, ^{
        instance = [UPPerformance new];
    });

    return instance;
}


- (void)start
{
    dispatch_async(dispatch_get_main_queue(), ^{

        UIWindow *window =
        [[UIWindow alloc]
         initWithFrame:UIScreen.mainScreen.bounds];

        window.windowLevel =
        UIWindowLevelAlert + 1;


        UPOverlayView *view =
        [[UPOverlayView alloc]
         initWithFrame:CGRectMake(0,0,150,55)];


        view.center =
        CGPointMake(
            window.bounds.size.width / 2,
            50
        );


        view.autoresizingMask =
        UIViewAutoresizingFlexibleLeftMargin |
        UIViewAutoresizingFlexibleRightMargin;


        [window addSubview:view];

        window.hidden = NO;

    });
}

@end


__attribute__((constructor))
static void UPInitialize()
{
    [[UPPerformance shared] start];
}
