//
//  ViewController.m
//  AcronymApp
//
//  Created by Joe Leung on 11/5/15.
//  Copyright (c) 2015 Joe Leung. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray* resultList;


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"LastSearch"]) {
        self.searchItem.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"LastSearch"];
    }
     
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    NSDictionary* rawResult = [NetworkHelper getResult:self.searchItem.text];
    
    
    
    if([segue.identifier isEqualToString:@"DisplayResultSegue"]){
        MyTableViewController *nextController = (MyTableViewController *)segue.destinationViewController;
        nextController.userInput = self.searchItem.text;
    }
    
    
}


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    if ([self.searchItem.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Please enter an acronym!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return NO;
    }
    NSRange whiteSpaceRange = [self.searchItem.text rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]];
    if (whiteSpaceRange.location != NSNotFound) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Please do not include any blank character"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return NO;
    }
    return YES;
}

@end
