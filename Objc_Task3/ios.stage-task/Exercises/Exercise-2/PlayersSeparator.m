#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    
    if (ratingArray.count < 3) return 0;
    int countOfTeams = 0;
    for (int i = 0; i < ratingArray.count - 2; i++) {
        long i_num = [ratingArray[i] integerValue];
        for (int j = i + 1; j < ratingArray.count - 1; j++) {
            long j_num = [ratingArray[j] integerValue];
            for (int k = j + 1; k < ratingArray.count; k++) {
                long k_num = [ratingArray[k] integerValue];
                if (((i_num < j_num) && (j_num < k_num)) || ((i_num > j_num) && (j_num > k_num))) countOfTeams++;
            }
        }
    }
    
    return countOfTeams;
}

@end
