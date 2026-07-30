#import "UPFPSMonitor.h"

static NSInteger currentFPS = 60;

@implementation UPFPSMonitor

+ (NSInteger)fps
{
    return currentFPS;
}

@end
