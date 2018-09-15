//
//  JTGMovieSearchClient.h
//  Movie.io
//
//  Created by Jason Goodney on 9/14/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JTGMovie.h"
#import "JTGMovieTrailer.h"

@interface JTGMovieSearchClient : NSObject

+ (void) searchForMoviesWithSearchTerm:(NSString *)searchTerm
                            withBlock:(void(^_Nullable)(NSArray<JTGMovie *> * _Nullable movies))block;

+ (void) fetchYoutubeTrailerForMovieId:(NSNumber *)identifier
                             withBlock:(void(^_Nullable)(JTGMovie * _Nullable movie))block;

+ (void) fetchMoviePosterForMovie:(JTGMovie *)movie
                        withBlock:(void(^_Nullable)(UIImage * _Nullable image))block;
@end
