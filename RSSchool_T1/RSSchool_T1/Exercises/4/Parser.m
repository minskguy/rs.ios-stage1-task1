#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSString *brackets = @"([<)]>";
    NSString *temp = [NSString stringWithString:string];
    NSMutableArray <NSString*> *result = [NSMutableArray arrayWithCapacity:1];
    
    for (int i = 0; i < string.length; i++) {
        for (int j = 0; j < 3; j++) {\
            if ([temp characterAtIndex:i]  == [brackets characterAtIndex:j]) {
                int counter = 0;
                for (int k = i + 1; k < string.length; k++) {
                    if ([temp characterAtIndex:k] == [brackets characterAtIndex:j]) {
                        counter++;
                        continue;
                    }
                    if ([temp characterAtIndex:k] == [brackets characterAtIndex:j+3] &&
                        counter != 0) {
                        counter--;
                        continue;
                    }
                    if ([temp characterAtIndex:k] == [brackets characterAtIndex:j+3] &&
                        counter == 0) {
                        [result addObject:[string substringWithRange:NSMakeRange(i+1,k-i-1)]];
                        break;
                    }
                }
            }
        }
    }
    
    return result;
}

@end
