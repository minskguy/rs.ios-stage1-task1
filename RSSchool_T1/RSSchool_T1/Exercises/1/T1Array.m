#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    NSMutableArray *array = [NSMutableArray arrayWithArray:sadArray];
    if (array.count == 0)
        return @[];
    else {
        for (int i = 1; i <= [array count]-2; i++){
            if ([array[i-1] intValue] + [array[i+1] intValue] < [array[i] intValue]){
                [array removeObjectAtIndex:i];
                if (i-2 < 0) i--; else i -= 2;
            }
        }
    }
    return array;
}

@end
