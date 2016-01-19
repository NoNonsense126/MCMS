//
//  CreatureViewController.m
//  MCMS
//
//  Created by Wong You Jing on 19/01/2016.
//  Copyright © 2016 NoNonsense. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController ()

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onEditButtonTapped:(UIBarButtonItem *)sender {
    sender.title = @"Done";
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Edit" message:@"Rename Creature" preferredStyle:UIAlertControllerStyleAlert];
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"New name";
    }];
    
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Rename" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *name = controller.textFields[0].text;
        self.creature.name = name;
        self.navigationItem.title = name;
    }];
    
    [controller addAction:saveAction];
    
    [self presentViewController:controller animated:YES completion:nil];
}
@end
