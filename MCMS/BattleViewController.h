//
//  BattleViewController.h
//  MCMS
//
//  Created by John McCants on 1/19/16.
//  Copyright © 2016 NoNonsense. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagicalCreature.h"

@interface BattleViewController : UIViewController

@property MagicalCreature *challenger;
@property MagicalCreature *opponent;

@end
