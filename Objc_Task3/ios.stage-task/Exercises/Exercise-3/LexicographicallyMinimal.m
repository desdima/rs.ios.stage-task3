#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
        const char *str1 = string1.UTF8String;
        NSMutableArray *arrstr1 = [[NSMutableArray alloc] init];
        for (int i = 0; i < strlen(str1); i++)
        {
            NSString *s = [NSString stringWithFormat:@"%c", str1[i]];
            [arrstr1 insertObject:s atIndex:i];
            
        }
    
        const char *str2 = string2.UTF8String;
        NSMutableArray *arrstr2 = [[NSMutableArray alloc] init];
        for (int i = 0; i < strlen(str2); i++)
        {
            NSString *s = [NSString stringWithFormat:@"%c", str2[i]];
            [arrstr2 insertObject:s atIndex:i];
        
        }
        NSMutableArray *arrstr3 = [[NSMutableArray alloc] init];
        //int c = 0;
        NSString *s1;
        NSString *s2;
        long end = arrstr1.count + arrstr2.count;
        for (int i = 0; i < end; i++) {
            if (arrstr1.count == 0) {s1 = nil;} else {
                s1 = [NSString stringWithFormat:@"%@", arrstr1[0]];}
            if (arrstr2.count == 0) {s2 = nil;} else {
                s2 = [NSString stringWithFormat:@"%@", arrstr2[0]];}
            const char *sc1 = s1.UTF8String;
            const char *sc2 = s2.UTF8String;
            BOOL ans1 = ([s1 compare:s2] == NSOrderedAscending);
            BOOL ans2 = ([s1 compare:s2] == NSOrderedSame);
            if (s2 == nil) {ans1 = YES; ans2 = YES;}
            if (((ans1 == YES) || (ans2 == YES)) && (s1 != nil)) {
                [arrstr3 insertObject:arrstr1[0] atIndex:i];
                [arrstr1 removeObjectAtIndex:0];
            } else
            {
                [arrstr3 insertObject:arrstr2[0] atIndex:i];
                [arrstr2 removeObjectAtIndex:0];
            }
        }
        
    NSLog(@"%@",arrstr3);
    
    NSMutableString *result = [[NSMutableString alloc] init];
    for (NSObject * obj in arrstr3)
    {
        [result appendString:[obj description]];
    }
    NSLog(@"%@",result);
        
        
    return result;
}

@end
