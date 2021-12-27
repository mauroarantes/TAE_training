//
//  ViewController.m
//  Day 2 playground
//
//  Created by Mauro Arantes on 21/12/2021.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@2, @7, @11, @15, @21, @39];
    NSLog(@"%@", [self f1:array]);
    // Do any additional setup after loading the view.
}

- (NSMutableArray*) f1:(NSArray*)list {
    int i = 0;
    int ans = 0;
    int target = 18;
    NSMutableArray *out = [[NSMutableArray alloc]init];
    for (id obj1 in list) {
        NSMutableArray *a1 = [[NSMutableArray alloc]init];
        a1 = [NSMutableArray arrayWithArray:list];
        [a1 removeObjectAtIndex:i];
        i++;
        for (id obj2 in a1) {
            ans = [obj1 intValue] + [obj2 intValue];
            if (ans == target) {
                [out addObject:obj1];
                [out addObject:obj2];
                return out;
            }
        }
    }
    return out;
}

@end
