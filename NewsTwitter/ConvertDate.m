//
//  ConvertDate.m
//  NewsTwitter
//
//  Created by Родион Баглай on 22.03.17.
//  Copyright © 2017 Student. All rights reserved.
//

#import "ConvertDate.h"

@implementation ConvertDate


-(NSString*)retrivePostTime:(NSString*)postDate{
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    NSDate *userPostDate = [df dateFromString:postDate];
    
    
    NSDate *currentDate = [NSDate date];
    NSTimeInterval distanceBetweenDates = [currentDate timeIntervalSinceDate:userPostDate];
    
    NSTimeInterval theTimeInterval = distanceBetweenDates;
    
    
    NSCalendar *sysCalendar = [NSCalendar currentCalendar];
    
    
    NSDate *date1 = [[NSDate alloc] init];
    NSDate *date2 = [[NSDate alloc] initWithTimeInterval:theTimeInterval sinceDate:date1];
    
    
    unsigned int unitFlags = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitSecond |NSCalendarUnitYear;
    
    NSDateComponents *conversionInfo = [sysCalendar components:unitFlags fromDate:date1  toDate:date2  options:0];
    
    NSString *returnDate;
    if ([conversionInfo month] > 0 && [conversionInfo month] <= 12)
    {
        returnDate = [NSString stringWithFormat:@"%ldмес ",(long)[conversionInfo month]];
    }
    
    else if ([conversionInfo day] > 0)
    {
        returnDate = [NSString stringWithFormat:@"%ldд ",(long)[conversionInfo day]];
    }
    else if ([conversionInfo hour]>0)
    {
        returnDate = [NSString stringWithFormat:@"%ldч ",(long)[conversionInfo hour]];
    }
    else if ([conversionInfo minute]>0)
    {
        returnDate = [NSString stringWithFormat:@"%ldмин ",(long)[conversionInfo minute]];
    }
    else
    {
        returnDate = [NSString stringWithFormat:@"%ldсек ",(long)[conversionInfo second]];
    }
    
//    if ([conversionInfo day] > 0 && [conversionInfo day] <= 3)
//           {
//                returnDate = [NSString stringWithFormat:@"%ldд ",(long)[conversionInfo day]];
//           }
//    else
//    {
//        return returnDate = [NSString stringWithFormat:@"%@", userPostDate];
//    }
    
    return returnDate;
}

@end
