//
//  JTGSearchTableViewCell.h
//  Movie.io
//
//  Created by Jason Goodney on 9/14/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTGMovie.h"


@interface JTGSearchTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;
//@property (weak, nonatomic, nullable)

@property (nonatomic) JTGMovie *movie;

+ (NSString *) cellId;

@end
