#import "UPPerformance.h"
#import "UPOverlayView.h"
#import <UIKit/UIKit.h>


@implementation UPPerformance

+ (instancetype)shared
{
    static UPPerformance *instance;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        instance = [[UPPerformance alloc] init];
    });

    return instance;
}


- (void)start
{
    dispatch_async(dispatch_get_main_queue(), ^{

        UIWindowScene *scene = nil;

        for (UIScene *s in UIApplication.sharedApplication.connectedScenes)
        {
            if ([s isKindOfClass:UIWindowScene.class])
            {
                scene = (UIWindowScene *)s;
                break;
            }
        }


        UIWindow *window;


        if (scene)
        {
            window =
            [[UIWindow alloc]
             initWithWindowScene:scene];
        }
        else
        {
            window =
            [[UIWindow alloc]
             initWithFrame:UIScreen.mainScreen.bounds];
        }


        UIViewController *controller =
        [[UIViewController alloc] init];


        window.rootViewController = controller;


        UPOverlayView *overlay =
        [[UPOverlayView alloc]
         initWithFrame:CGRectMake(0,0,150,55)];


        CGFloat width =
        window.bounds.size.width;


        CGFloat top =
        window.safeAreaInsets.top;


        overlay.center =
        CGPointMake(width / 2,
                    top + 35);


        overlay.autoresizingMask =
        UIViewAutoresizingFlexibleLeftMargin |
        UIViewAutoresizingFlexibleRightMargin;


        [controller.view addSubview:overlay];


        window.windowLevel =
        UIWindowLevelAlert + 1;


        window.hidden = NO;
        window.alpha = 1.0;


        self->_window = window;

    });
}


@end



__attribute__((constructor))
static void UPInitialize()
{
    NSLog(@"UniversalPerformance dylib loaded");


    dispatch_async(dispatch_get_main_queue(), ^{

        [[UPPerformance shared] start];

    });
}
