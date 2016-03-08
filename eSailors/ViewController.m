//
//  ViewController.m
//  eSailors
//
//  Created by Bruno Rocha on 3/7/16.
//  Copyright © 2016 eSailors. All rights reserved.
//

#import "ViewController.h"
#import "APIService+Archive.h"
#import "Report.h"
#import "WeatherTableViewCell.h"
#import "DetailsViewController.h"
#import "APIService+Latest.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, weak) IBOutlet UITableView *tableView;
@property(nonatomic, weak) IBOutlet UIView *tableViewHeader;
@property(nonatomic, strong) NSArray *content;

- (IBAction)latestWeatherInfo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.translucent = NO;
    _tableView.tableHeaderView = _tableViewHeader;
    self.title = @"Mars forecast list";
    
    [[APIService instance] marsArchive:^(NSURLSessionDataTask *task, id object) {
        
        self.content = [NSArray arrayWithArray: object];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [[[UIAlertView alloc] initWithTitle: @"Alert!"
                                    message: error.localizedDescription
                                   delegate: nil
                          cancelButtonTitle: @"OK"
                          otherButtonTitles: nil, nil] show];
        
        
    }];
    
}

- (void)setContent:(NSArray *)content {
    
    _content = content;
    
    [_tableView reloadData];
}

#pragma mark -
#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    WeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"WeatherTableViewCell"];
    
    Report *report = _content[indexPath.row];
    
    cell.report = report;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _content.count;
}

#pragma mark -
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath: indexPath animated: YES];
    
    Report *report = _content[indexPath.row];
    
    [self pushDetailView: report];
    
}

#pragma mark - 
#pragma mark - IBAction Methnods

- (IBAction)latestWeatherInfo {
    
    [[APIService instance] latestWeatherInfo:^(NSURLSessionDataTask *task, id object) {
        
        [self pushDetailView: object];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
       
        [[[UIAlertView alloc] initWithTitle: @"Alert!"
                                    message: error.localizedDescription
                                   delegate: nil
                          cancelButtonTitle: @"OK"
                          otherButtonTitles: nil, nil] show];
        
    }];
    
}

- (void)pushDetailView:(Report *)report {
    
    DetailsViewController *detailsViewController = [[UIStoryboard storyboardWithName: @"Main" bundle: [NSBundle mainBundle]] instantiateViewControllerWithIdentifier: @"detailsViewController"];
    detailsViewController.report = report;
    [self.navigationController pushViewController: detailsViewController animated: YES];

}

@end
