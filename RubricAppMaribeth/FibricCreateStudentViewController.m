//
//  FibricCreateStudentViewController.m
//  RubricAppMaribeth
//
//  Created by Maribeth Rauh on 3/22/13.
//  Copyright (c) 2013 Maribeth Rauh. All rights reserved.
//

#import "FibricCreateStudentViewController.h"

@interface FibricCreateStudentViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstNameInputField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameInputField;
@property (weak, nonatomic) IBOutlet UITextField *classNameInputField;
@property (weak, nonatomic) IBOutlet UILabel *studentNameDisplay;

@property (strong, nonatomic) FibricStudent *currentStudent;

@end

@implementation FibricCreateStudentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.currentStudent = [[SPStudent alloc] init];
    
    // Enables the user to stop editing the text field when they tap outside the field
    UITapGestureRecognizer *tapScroll = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped)];
    tapScroll.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapScroll];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Saving input as properties of currentStudent

- (IBAction)firstNameEdited:(id)sender {
    self.currentStudent.firstName = self.firstNameInputField.text;  // text from UITextView stored as a property in an object of type SPStudent
    self.studentNameDisplay.text = [self.currentStudent firstName]; // property displayed in label for debugging purposes
}

- (IBAction)lastNameEdited:(id)sender {
    self.currentStudent.lastName = self.lastNameInputField.text;
    self.studentNameDisplay.text = [self.currentStudent lastName];
}

- (IBAction)classNameEdited:(id)sender {
    self.currentStudent.className = self.classNameInputField.text;
    self.studentNameDisplay.text = [self.currentStudent className];
}


#pragma mark - End editing/resign keyboard methods

// Ends editing of text fields for enter button on keyboard, DONE on ipad keyboard
- (BOOL) textFieldShouldReturn: (UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

// Ends editing on touch outside of field - input will be saved, keyboard will be dismissed
- (void) tapped {
    NSLog(@"tapped to end editing method");
    [self.view endEditing:YES];
}



#pragma mark - Passing currentStudent to SPHomeViewController via delegate

- (IBAction)saveNewStudent {
    [self.delegate addStudentToArray:self];
}

@end
