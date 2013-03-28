//
//  FibricHomeViewController.h
//  RubricAppMaribeth
//
//  Created by Maribeth Rauh on 3/22/13.
//  Copyright (c) 2013 Maribeth Rauh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FibricStudent.h"
#import "FibricCreateStudentViewController.h"

@interface FibricHomeViewController : UIViewController <saveStudentDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *studentsTableView;
@property (weak, nonatomic) IBOutlet UITableView *rubricsTableView;

@end
