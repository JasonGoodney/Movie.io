//
//  JTGMovie.h
//  Movie.io
//
//  Created by Jason Goodney on 9/14/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTGMovie : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *overview;
@property (nonatomic, copy) NSNumber *rating;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end
