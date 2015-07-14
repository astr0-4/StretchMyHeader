//
//  NewsCell.h
//  StretchMyHeader
//
//  Created by Alex on 2015-07-14.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *headlineLabel;

@end
