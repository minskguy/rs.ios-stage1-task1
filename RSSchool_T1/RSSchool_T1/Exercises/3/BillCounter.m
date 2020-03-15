#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    int sum_actual = 0;
    for (int i = 0; i < bill.count; i++) {
        if (i != index) {
            sum_actual += [bill[i] intValue];
        }
    }
    sum_actual /= 2;
    if (sum_actual == [sum intValue])
        return @"Bon Appetit";
    else {
        return [[NSNumber numberWithInt: ([sum intValue] - sum_actual)] stringValue];
    }
}

@end
