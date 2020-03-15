#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    int changeNeeded = 0, changeCounter = [k intValue];
    NSMutableString *result = [NSMutableString stringWithString:s];
    for (int i = 0; i < [n intValue] / 2; i++)
        if ([result characterAtIndex:i] != [result characterAtIndex:[n intValue]-1-i])
            changeNeeded++;
    
    if (changeCounter < changeNeeded) return @"-1";
    
    else {
        for (int i = 0; i < [n intValue] / 2; i++) {
            if (([result characterAtIndex:i] == '9' &&
                [result characterAtIndex:[n intValue]-1-i] != '9') ||
                
                ([result characterAtIndex:i] != '9' &&
                 [result characterAtIndex:[n intValue]-1-i] == '9')) {
                if ([result characterAtIndex:i] == '9')
                    [result replaceCharactersInRange:NSMakeRange([n intValue]-1-i, 1) withString:@"9"];
                else [result replaceCharactersInRange:NSMakeRange(i, 1) withString:@"9"];
                changeCounter--;
            }
            else {
                if ([result characterAtIndex:i] != '9' &&
                    [result characterAtIndex:[n intValue]-1-i] != '9') {
                    if (changeCounter-2 >= changeNeeded-1) {
                        [result replaceCharactersInRange:NSMakeRange(i, 1) withString:@"9"];
                        [result replaceCharactersInRange:NSMakeRange([n intValue]-1-i, 1) withString:@"9"];
                        changeCounter -= 2;
                    }
                    else {
                        if ([result characterAtIndex:i] != [result characterAtIndex:[n intValue]-1-i]) {
                            if ([result characterAtIndex:i] > [result characterAtIndex:
                                                                   [n intValue]-1-i])
                                [result replaceCharactersInRange:NSMakeRange([n intValue]-1-i, 1) withString: [NSString stringWithFormat:@"%c", [result characterAtIndex:i]]];
                            else
                                [result replaceCharactersInRange:NSMakeRange(i, 1) withString: [NSString stringWithFormat:@"%c", [result characterAtIndex:[n intValue]-1-i]]];
                            changeCounter--;
                        }
                    
                    }
                }
            }
        }
        return result;
    }
    
}
@end
