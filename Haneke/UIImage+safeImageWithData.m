//
//  UIImage+safeImageWithData.m
//  Azubu
//
//  Created by Eugene on 2/23/16.
//  Copyright © 2016 GeeksForLess Inc. All rights reserved.
//

#import "UIImage+safeImageWithData.h"

static NSLock* hnk_imageLock = nil;

@implementation UIImage (safeImageWithData)

+ (void)initialize
{
    hnk_imageLock = [[NSLock alloc] init];
}

+ (UIImage *)hnk_safeImageWithData:(NSData *)data {
    UIImage* image = nil;
    
    [hnk_imageLock lock];
    image = [UIImage imageWithData:data];
    [hnk_imageLock unlock];
    return image;
}

@end
