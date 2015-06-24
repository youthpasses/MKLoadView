//
//  MKLoadingView.m
//  electrombile
//
//  Created by MaKai on 15/6/24.
//  Copyright (c) 2015年 makai. All rights reserved.
//

#import "MKLoadingView.h"

@implementation MKLoadingView{
    
    CGSize size;
    UIActivityIndicatorView *activityView;
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        size = [UIScreen mainScreen].bounds.size;
        
        [self addItems];
    }
    return self;
}

- (void)addItems {
    
    float width = size.width / 3.;
    float height = width * 2. / 3.;
//    
    [self setFrame:CGRectMake(size.width / 2. - width / 2., size.height / 2. - height / 2. - 50, width, height)];
    
    [self setBackgroundColor:[UIColor blackColor]];
    [self.layer setCornerRadius:6];
    [self setAlpha:.7];
    [self.layer setMasksToBounds:YES];
    
    int fontSize = 16;
    float activityViewHeight = 60;
    float labelHeight = 45;
    
    if (size.height == 568 || size.height == 480) {
        fontSize = 14;
        activityViewHeight = activityViewHeight * six2fives;
        labelHeight = labelHeight * six2fives;
    }else if (size.height == 736) {
        fontSize = 18;
        activityViewHeight = activityViewHeight * six2sixp;
        labelHeight = labelHeight * six2sixp;
    }
    
    activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, width, activityViewHeight)];
    [activityView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [self addSubview:activityView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, height - labelHeight, width, labelHeight)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setText:@"正在加载..."];
    [label setFont:[UIFont systemFontOfSize:fontSize]];
    [label setTextColor:[UIColor whiteColor]];
    [self addSubview:label];
    [self setHidden:YES];
}

- (void)startLoading {
    [self setAlpha:.7];
    [self setHidden:NO];
    [activityView startAnimating];
    
}

- (void)stopLoading {
    
    [UIView animateWithDuration:.2 animations:^{
        [self setAlpha:0];
    }completion:^(BOOL finished) {
        [self setHidden:YES];
        [activityView stopAnimating];
    }];
}

@end
