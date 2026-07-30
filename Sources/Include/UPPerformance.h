#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UPPerformance : NSObject

@property(nonatomic,strong) UIWindow *window;

+ (instancetype)shared;

- (void)start;

@end
