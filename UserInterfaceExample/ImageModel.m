//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

#import "ImageModel.h"

@interface ImageModel ()

@property (strong, nonatomic) NSArray* imageNames;
@property (strong, nonatomic) NSDictionary* imageMapper;

@end


@implementation ImageModel
@synthesize imageNames = _imageNames;
@synthesize imageMapper = _imageMapper;

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    });
    return _sharedInstance;
}

-(NSArray*) imageNames{
    if(!_imageNames)
        _imageNames = @[@"Bill",@"Eric",@"Jeff",@"Chris",@"Panera",@"Reece"];

    return _imageNames;
}


-(NSDictionary*) imageMapper{
    if(!_imageMapper) {
        _imageMapper = @{
            @"Bill": [UIImage imageNamed:@"Bill"],
            @"Eric": [UIImage imageNamed:@"Eric"],
            @"Jeff": [UIImage imageNamed:@"Jeff"],
            @"Chris": [UIImage imageNamed:@"Chris"],
            @"Panera": [UIImage imageNamed:@"Panera"],
            @"Reece": [UIImage imageNamed:@"Reece"]
        };
    }
    
    return _imageMapper;
}


-(UIImage*)getImageWithName:(NSString*)name{
    return self.imageMapper[name];
}

-(UIImage*)getImageWithIndex:(NSInteger)index{
    return self.imageMapper[self.imageNames[index]];
}

-(NSInteger)numberOfImages{
    return [self.imageMapper count];
}

-(NSString*)getImageNameForIndex:(NSInteger)index{
    return self.imageNames[index];
}



@end
