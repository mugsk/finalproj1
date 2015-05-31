//
//  ProfileViewController.m
//  finalproj1
//
//  Created by Mugdha Kanhere on 2/20/15.
//  Copyright (c) 2015 Mugdha Kanhere. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

-(NSString *)docsDir{
    //Searches in the Document directories and gets the first result
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    listPath = [[self docsDir]stringByAppendingString:@"TripJournalDataSet.plist"];
    
    //If there is nothing at this path
    
    if(![[NSFileManager defaultManager]fileExistsAtPath:listPath]){
        
        [[NSFileManager defaultManager]copyItemAtPath:[[NSBundle mainBundle]pathForResource:@"TripJournalDataSet" ofType:@"plist"] toPath: listPath error:nil];
        
    }
    
    // There is a proerty list in the documents directory
    
    tripEntriesArray = [NSMutableArray arrayWithContentsOfFile:listPath];
    
    //Set the number of journal entries and the photos uploaded on the profile page
    self.journalEntries.text = [NSString stringWithFormat:@"%lu",[tripEntriesArray count]];
    self.photosUploaded.text = [NSString stringWithFormat:@"%lu",[tripEntriesArray count]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
