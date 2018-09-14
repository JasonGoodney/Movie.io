//
//  JTGSearchTableViewCell.m
//  Movie.io
//
//  Created by Jason Goodney on 9/14/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

#import "JTGSearchTableViewCell.h"

@implementation JTGSearchTableViewCell

+ (NSString *) cellId {
    return @"JTGSearchTableViewCell";
}

- (void)setMovie:(JTGMovie *)movie {
    _movie = movie;
    
    _titleLabel.text = movie.title;
    _overviewLabel.text = movie.overview;
    
    _ratingLabel.text = [NSString stringWithFormat:@"Rating: %@", movie.rating];
}


@end
