//
//  ViewController.m
//  CarsObjC1
//
//  Created by Mauro Arantes on 23/12/2021.
//

#import "ViewController.h"
#import "Car.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray<Car *> *cars;

@end

@implementation ViewController

NSString *cellId = @"cellId";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupCars];
    self.navigationItem.title = @"Top Exotic Cars";
    self.navigationController.navigationBar.prefersLargeTitles = "YES";
    self.tableView.rowHeight = 100;
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:cellId];
    
    // Do any additional setup after loading the view.
}

- (void) setupCars {
    self.cars = NSMutableArray.new;
    [self fetchData];
//    Car *c1 = Car.new;
//    c1.title = @"Tesla";
//    c1.image = [UIImage imageNamed:@"Tesla-Roadster.jpeg"];
//    [self.cars addObject:c1];
//
//    Car *c2 = Car.new;
//    c2.title = @"Volvo";
//    c2.image = [UIImage imageNamed:@"2020VolvoPolestar1.jpeg"];
//    [self.cars addObject:c2];
    
}

- (void) fetchData {
    Car *c1 = Car.new;
    c1.title = @"Tesla";
    c1.image = [UIImage imageNamed:@"Tesla-Roadster.jpeg"];
    Car *c2 = Car.new;
    c2.title = @"Volvo";
    c2.image = [UIImage imageNamed:@"2020VolvoPolestar1.jpeg"];
    Car *c3 = Car.new;
    c3.title = @"Aston Martin";
    c3.image = [UIImage imageNamed:@"2019AstonMartinDBSSuperleggera.jpeg"];
    Car *c4 = Car.new;
    c4.title = @"Audi";
    c4.image = [UIImage imageNamed:@"2020AudiRS6Avant.jpeg"];
    Car *c5 = Car.new;
    c5.title = @"Bentley";
    c5.image = [UIImage imageNamed:@"2020BentleyContinentalGTConvertible.jpeg"];
    Car *c6 = Car.new;
    c6.title = @"Bugatti";
    c6.image = [UIImage imageNamed:@"2020BugattiChironSuperSport300.jpeg"];
    Car *c7 = Car.new;
    c7.title = @"Ferrari";
    c7.image = [UIImage imageNamed:@"2020ferrariSF90Stradale.jpeg"];
    Car *c8 = Car.new;
    c8.title = @"Lamborghini";
    c8.image = [UIImage imageNamed:@"2020LamborghiniAventadorSVJRoadster.jpeg"];
    Car *c9 = Car.new;
    c9.title = @"Mercedes";
    c9.image = [UIImage imageNamed:@"2020MercedesAMGGT63SFourDoor.jpeg"];
    Car *c10 = Car.new;
    c10.title = @"Porsche";
    c10.image = [UIImage imageNamed:@"2020PorscheTaycanMissionEConcept.jpeg"];
    [self.cars addObject:c1];
    [self.cars addObject:c2];
    [self.cars addObject:c3];
    [self.cars addObject:c4];
    [self.cars addObject:c5];
    [self.cars addObject:c6];
    [self.cars addObject:c7];
    [self.cars addObject:c8];
    [self.cars addObject:c9];
    [self.cars addObject:c10];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView
        dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    Car *car = self.cars[indexPath.row];
    
    cell.textLabel.text = car.title;
    cell.imageView.image = car.image;
    cell.imageView.layer.cornerRadius = 10;
    cell.imageView.clipsToBounds = YES;
    return cell;
}

@end
