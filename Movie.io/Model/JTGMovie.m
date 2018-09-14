//
//  JTGMovie.m
//  Movie.io
//
//  Created by Jason Goodney on 9/14/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

#import "JTGMovie.h"

@implementation JTGMovie

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super init]) {
        _title = dictionary[@"title"];
        _overview = dictionary[@"overview"];
        _rating = dictionary[@"vote_average"];
    }
    return self;
}

@end
