//
//  ProfileViewController.h
//  finalproj1
//
//  Created by Mugdha Kanhere on 2/20/15.
//  Copyright (c) 2015 Mugdha Kanhere. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController
{
    //Path in the documents directory
    NSString *listPath;
    NSMutableArray *tripEntriesArray;
}
@property (weak, nonatomic) IBOutlet UILabel *journalEntries;

@property (weak, nonatomic) IBOutlet UILabel *photosUploaded;


@end
