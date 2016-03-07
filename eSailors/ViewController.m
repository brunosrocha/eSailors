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

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, weak) IBOutlet UITableView *tableView;
@property(nonatomic, strong) NSArray *content;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.translucent = NO;
    
    [[APIService instance] marsArchive:^(NSURLSessionDataTask *task, id object) {
        
        self.content = [NSArray arrayWithArray: object];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
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
    
    
    
}
@end
