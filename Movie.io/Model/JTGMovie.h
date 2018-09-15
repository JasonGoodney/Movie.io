//
//  JTGMovie.h
//  Movie.io
//
//  Created by Jason Goodney on 9/14/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JTGMovieTrailer.h"

NS_ASSUME_NONNULL_BEGIN

@interface JTGMovie : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *overview;
@property (nonatomic, copy) NSString *homepage;
@property (nonatomic, copy) NSString *posterPath;
@property (nonatomic, copy) NSString *tagline;
@property (nonatomic, copy) NSNumber *rating;
@property (nonatomic, copy) NSNumber *identifier;
@property (nonatomic) JTGMovieTrailer *movieTrailer;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
