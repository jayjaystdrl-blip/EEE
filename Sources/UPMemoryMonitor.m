#import "UPMemoryMonitor.h"
#import <mach/mach.h>

@implementation UPMemoryMonitor

+ (double)memory
{
    struct mach_task_basic_info info;

    mach_msg_type_number_t count =
    MACH_TASK_BASIC_INFO_COUNT;


    task_info(
      mach_task_self(),
      MACH_TASK_BASIC_INFO,
      (task_info_t)&info,
      &count
    );


    return info.resident_size /
    1024.0 /
    1024.0;
}

@end
