//
//  DetailViewController.h
//  StretchMyHeader
//
//  Created by Alex on 2015-07-14.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

