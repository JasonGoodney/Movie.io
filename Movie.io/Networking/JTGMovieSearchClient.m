//
//  JTGMovieSearchClient.m
//  Movie.io
//
//  Created by Jason Goodney on 9/14/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

#import "JTGMovieSearchClient.h"

@interface JTGMovieSearchClient ()

+ (NSURL *) baseURL;

@end

@implementation JTGMovieSearchClient

+ (NSURL *) baseURL {
    return [[NSURL alloc] initWithString:@"https://api.themoviedb.org/3/search/movie"];
}

+ (NSString *)apiKey {
    static NSString *apiKey = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *apiKeysURL = [[NSBundle mainBundle] URLForResource:@"APIKeys" withExtension:@"plist"];
        if (!apiKeysURL) {
            NSLog(@"Error! APIKeys file not found!");
            return;
        }
        NSDictionary *apiKeys = [[NSDictionary alloc] initWithContentsOfURL:apiKeysURL];
        apiKey = apiKeys[@"TheMovieDB"];
    });
    return apiKey;
}

+ (void)searchForMoviesWithSearchTerm:(NSString *)searchTerm
                            withBlock:(void (^)(NSArray<JTGMovie *> * _Nullable))block {
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:[JTGMovieSearchClient baseURL]  resolvingAgainstBaseURL:YES];
    NSURLQueryItem *apiKeyQueryItem = [[NSURLQueryItem alloc] initWithName:@"api_key" value:[JTGMovieSearchClient apiKey]];
    NSURLQueryItem *searchQueryItem = [[NSURLQueryItem alloc] initWithName:@"query" value:searchTerm.lowercaseString];
    components.queryItems = @[apiKeyQueryItem, searchQueryItem];
    NSURL *url = components.URL;
    
    NSLog(@"%@", [url absoluteString]);
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error){
            NSLog(@"Error in %s, %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            block(nil);
            return;
        }
        NSLog(@"%@", response);
        
        if (!data){
            NSLog(@"NO DATA AVAILABLE");
            block(nil);
            return;
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSArray<NSDictionary *> *searchResultsArray = topLevelDictionary[@"results"];
        NSMutableArray<JTGMovie *> *movies = [[NSMutableArray alloc] init];
        
        for (NSDictionary *movieDict in searchResultsArray) {
            JTGMovie *movie = [[JTGMovie alloc] initWithDictionary:movieDict];
            [movies addObject:movie];
        }
        
        block(movies);
    }] resume];
}

@end






























