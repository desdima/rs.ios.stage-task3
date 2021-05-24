#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    if ((monthNumber < 0) || (monthNumber > 12)) {
        return nil;
    }
    NSDictionary *months = @{
        @1: @"January",
        @2: @"February",
        @3: @"March",
        @4: @"April",
        @5: @"May",
        @6: @"June",
        @7: @"July",
        @8: @"August",
        @9: @"September",
        @10: @"October",
        @11: @"November",
        @12: @"December",
    };
    NSString *month_name = [months objectForKey:@(monthNumber)];
    return month_name;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    NSDate *dateFromString = [dateFormatter dateFromString:date];
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *yearFromDate = [calendar components:NSCalendarUnitYear fromDate:dateFromString];
    NSDateComponents *monthFromDate = [calendar components:NSCalendarUnitMonth fromDate:dateFromString];
    NSDateComponents *dayFromDate = [calendar components:NSCalendarUnitDay fromDate:dateFromString];
    NSDateComponents *hourFromDate = [calendar components:NSCalendarUnitHour fromDate:dateFromString];
    NSDateComponents *minuteFromDate = [calendar components:NSCalendarUnitMinute fromDate:dateFromString];
    NSDateComponents *secondFromDate = [calendar components:NSCalendarUnitSecond fromDate:dateFromString];
    
    NSInteger year_value = [yearFromDate year];
    NSInteger month_value = [monthFromDate month];
    NSInteger day_value = [dayFromDate day];
    NSInteger hour_value = [hourFromDate hour];
    NSInteger minute_value = [minuteFromDate minute];
    NSInteger second_value = [secondFromDate second];
    
    /*--- Check for correct date & time*/
    if ((year_value < 0) || (month_value < 0) || (month_value > 12) || (day_value < 0) || (day_value > 31) || (hour_value < 0) || (hour_value > 24) || (minute_value < 0) || (minute_value > 60) || (second_value < 0) || (second_value > 60)) return 0;
    
    return day_value;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *yearFromDate = [calendar components:NSCalendarUnitYear fromDate:date];
    NSDateComponents *monthFromDate = [calendar components:NSCalendarUnitMonth fromDate:date];
    NSDateComponents *dayFromDate = [calendar components:NSCalendarUnitDay fromDate:date];
    
    NSInteger year_value = [yearFromDate year];
    NSInteger month_value = [monthFromDate month];
    NSInteger day_value = [dayFromDate day];
    if ((year_value < 0) || (month_value < 0) || (month_value > 12) || (day_value < 0) || (day_value > 31)) return nil;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateFormat:@"EE"];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"]];

    NSString *dayName = [dateFormatter stringFromDate:date];
    
    return dayName;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSDate *currentDate = [NSDate now];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init] ;
    [dateFormatter setDateFormat:@"EEEE"];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"]];
    NSString *dayName = [dateFormatter stringFromDate:currentDate];
    
    NSDictionary *days = @{
        @"понедельник": @1,
        @"вторник": @2,
        @"среда": @3,
        @"четверг": @4,
        @"пятница": @5,
        @"суббота": @6,
        @"воскресенье": @7
    };
    
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    
    id numberOfDay = [days objectForKey:dayName];
    long t = [numberOfDay integerValue];
    dayComponent.day = 0 - [numberOfDay integerValue] + 1;
    
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    if (t == 1) dayComponent.day = 0;
    NSDate *FirstDayOfWeek = [theCalendar dateByAddingComponents:dayComponent toDate:currentDate options:0];
    
    dayComponent.day = 7 - [numberOfDay integerValue];
    if (t == 7) dayComponent.day = 0;
    NSDate *LastDayOfWeek = [theCalendar dateByAddingComponents:dayComponent toDate:currentDate options:0];
    
    
    BOOL answer = YES;
    if (([date compare:LastDayOfWeek] == NSOrderedDescending) || ([date compare:FirstDayOfWeek] == NSOrderedAscending)) {
        answer = NO;
    }
    
    long r = [date timeIntervalSinceDate:currentDate];
    if (r == 0) return YES;
    
   return answer;
}

@end
