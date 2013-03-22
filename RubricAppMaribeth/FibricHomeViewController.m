//
//  FibricHomeViewController.m
//  RubricAppMaribeth
//
//  Created by Maribeth Rauh on 3/22/13.
//  Copyright (c) 2013 Maribeth Rauh. All rights reserved.
//

#import "FibricHomeViewController.h"

@interface FibricHomeViewController ()

@property (strong, nonatomic) NSMutableArray *students; // Holds student objects returned from create student view
@property (strong, nonatomic) NSMutableArray *rubrics;
@property (weak, nonatomic) IBOutlet UILabel *studentPropertyDisplay;

@end


@implementation FibricHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Changes the navigation bar's back item label
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                     style:UIBarButtonItemStyleBordered
                                    target:nil
                                    action:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Setters/Getters overridden

// **Must use synthesize if both setter and getter overridden

// Lazy instantiation
- (NSMutableArray *) students {
    if (!_students) {
        _students = [[NSMutableArray alloc] init];
    }
    
    return _students;
}

-(NSMutableArray *)rubrics {
    if (!_rubrics) {
        _rubrics = [[NSMutableArray alloc] init];
    }
    
    return _rubrics;
}


#pragma mark - Model Methods

//- (void) addStudentToArray:(SPCreateStudentViewController *)sender {
//    NSLog(@"Done button tapped!");
//}

@end