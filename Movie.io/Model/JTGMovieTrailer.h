//
//  JTGMovieTrailer.h
//  Movie.io
//
//  Created by Jason Goodney on 9/14/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JTGMovieTrailer : NSObject

@property (nonatomic, copy) NSString *youtubeTrailerVideoId;
@property (nonatomic, copy) NSString *youtubeTrailerTitle;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
