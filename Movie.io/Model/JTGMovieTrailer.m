//
//  JTGMovieTrailer.m
//  Movie.io
//
//  Created by Jason Goodney on 9/14/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

#import "JTGMovieTrailer.h"

@implementation JTGMovieTrailer

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        _youtubeTrailerVideoId = dictionary[@"key"];
        _youtubeTrailerTitle = dictionary[@"name"]; 
    }
    return self;
}

@end
