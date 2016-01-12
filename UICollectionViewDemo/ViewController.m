//
//  ViewController.m
//  UICollectionViewDemo
//
//  Created by Lee on 14-2-13.
//  Copyright (c) 2014年 Lee. All rights reserved.
//

#import "ViewController.h"
#define KCellIdentifier @"identifier"
#import "ShowImageCell.h"
#import "CircleLayout.h"
@interface ViewController ()

@end

@implementation ViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, width, height)
                                             collectionViewLayout:[[CircleLayout alloc] init]];
    
    [self.collectionView registerClass:[ShowImageCell class] forCellWithReuseIdentifier:KCellIdentifier];
    self.collectionView.backgroundColor = [UIColor yellowColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView setContentOffset:CGPointMake(width, 0.0F)];
    [self.view addSubview:self.collectionView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UICollectionViewDelegate
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)cView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    // must be dequeueReusableCellWithReuseIdentifier !!!!
    ShowImageCell *cell = (ShowImageCell *)[cView dequeueReusableCellWithReuseIdentifier:KCellIdentifier
                                                                  forIndexPath:indexPath];
    NSString *imageName = [NSString stringWithFormat:@"%d.JPG",indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:imageName];
    cell.titleLabel.text = imageName;
    return cell;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    //无限循环....
    float targetX = _scrollView.contentOffset.x;
    int numCount = [self.collectionView numberOfItemsInSection:0];
    float ITEM_WIDTH = _scrollView.frame.size.width;
    
    if (numCount>=3)
    {
        if (targetX < ITEM_WIDTH/2) {
            [_scrollView setContentOffset:CGPointMake(targetX+ITEM_WIDTH *numCount, 0)];
        }
        else if (targetX >ITEM_WIDTH/2+ITEM_WIDTH *numCount)
        {
            [_scrollView setContentOffset:CGPointMake(targetX-ITEM_WIDTH *numCount, 0)];
        }
    }
    
}

@end
