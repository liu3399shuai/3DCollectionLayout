//
//  ViewController.h
//  UICollectionViewDemo
//
//  Created by Lee on 14-2-13.
//  Copyright (c) 2014年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate,
UICollectionViewDataSource,UIScrollViewDelegate>
{
      
}
@property (nonatomic,strong) UICollectionView *collectionView;
@end
