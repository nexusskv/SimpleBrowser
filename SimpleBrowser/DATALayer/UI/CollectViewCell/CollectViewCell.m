//
//  CollectViewCell.m
//  SimpleBrowser
//
//  Created by rost on 24.12.13.
//  Copyright (c) 2013 rost. All rights reserved.
//

#import "CollectViewCell.h"

@implementation CollectViewCell

@synthesize iconImg;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor        = [UIColor clearColor];
        self.layer.shadowColor      = [UIColor blackColor].CGColor;
        self.layer.shadowOffset     = CGSizeMake(3.0f, 5.0f);
        self.layer.shadowOpacity    = 0.5;
        self.layer.shadowRadius     = 2.0;
        self.layer.shadowPath       = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:7.0f].CGPath;

        iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, frame.size.width, frame.size.height)];
        [self.contentView addSubview:iconImg];

        self.contentView.backgroundColor = [UIColor colorWithRed:255/255.0f green:244/255.0f blue:240/255.0f alpha:0.7f];
        self.contentView.layer.cornerRadius        = 7.0f;
        self.contentView.layer.borderWidth         = 0.3f;
        self.contentView.layer.borderColor         = [[UIColor lightGrayColor] CGColor];
        self.contentView.clipsToBounds             = TRUE;
    }
    return self;
}

@end
