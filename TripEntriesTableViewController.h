//
//  TripEntriesTableViewController.h
//  finalproj1
//
//  Created by Mugdha Kanhere on 2/20/15.
//  Copyright (c) 2015 Mugdha Kanhere. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TripEntriesTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
    //Path in the documents directory
    NSString *listPath;
    NSMutableArray *tripEntriesArray;
}


@end
