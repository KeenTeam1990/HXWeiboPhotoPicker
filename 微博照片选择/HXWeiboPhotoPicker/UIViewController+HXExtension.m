//
//  UIViewController+HXExtension.m
//  微博照片选择
//
//  Created by 洪欣 on 2017/11/24.
//  Copyright © 2017年 洪欣. All rights reserved.
//

#import "UIViewController+HXExtension.h"
#import "HXPhotoPicker.h" 

@implementation UIViewController (HXExtension)
- (void)hx_presentAlbumListViewControllerWithManager:(HXPhotoManager *)manager delegate:(id)delegate {
    HXAlbumListViewController *vc = [[HXAlbumListViewController alloc] init];
    vc.delegate = delegate ? delegate : (id)self;
    vc.manager = manager;
    HXCustomNavigationController *nav = [[HXCustomNavigationController alloc] initWithRootViewController:vc];
    nav.supportRotation = manager.configuration.supportRotation;
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)hx_presentAlbumListViewControllerWithManager:(HXPhotoManager *)manager done:(HXAlbumListViewControllerDidDoneBlock)done cancel:(HXAlbumListViewControllerDidCancelBlock)cancel {
    HXAlbumListViewController *vc = [[HXAlbumListViewController alloc] init];
    vc.manager = manager;
    vc.doneBlock = done;
    vc.cancelBlock = cancel;
    HXCustomNavigationController *nav = [[HXCustomNavigationController alloc] initWithRootViewController:vc];
    nav.supportRotation = manager.configuration.supportRotation;
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)hx_presentCustomCameraViewControllerWithManager:(HXPhotoManager *)manager delegate:(id)delegate {
    HXCustomCameraViewController *vc = [[HXCustomCameraViewController alloc] init];
    vc.delegate = delegate ? delegate : (id)self;
    vc.manager = manager;
    vc.isOutside = YES;
    HXCustomNavigationController *nav = [[HXCustomNavigationController alloc] initWithRootViewController:vc];
    nav.isCamera = YES;
    nav.supportRotation = manager.configuration.supportRotation;
    nav.modalPresentationStyle = manager.configuration.hxCameraModalPresentationStyle;
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)hx_presentCustomCameraViewControllerWithManager:(HXPhotoManager *)manager done:(HXCustomCameraViewControllerDidDoneBlock)done cancel:(HXCustomCameraViewControllerDidCancelBlock)cancel {
    HXCustomCameraViewController *vc = [[HXCustomCameraViewController alloc] init];
    vc.doneBlock = done;
    vc.cancelBlock = cancel;
    vc.manager = manager;
    vc.isOutside = YES;
    HXCustomNavigationController *nav = [[HXCustomNavigationController alloc] initWithRootViewController:vc];
    nav.isCamera = YES;
    nav.supportRotation = manager.configuration.supportRotation;
    nav.modalPresentationStyle = manager.configuration.hxCameraModalPresentationStyle;
    [self presentViewController:nav animated:YES completion:nil];
}

- (BOOL)navigationBarWhetherSetupBackground {
    if ([self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault]) {
        return YES;
    }else if ([self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsCompact]) {
        return YES;
    }else if ([self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefaultPrompt]) {
        return YES;
    }else if ([self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsCompactPrompt]) {
        return YES;
    }else if (self.navigationController.navigationBar.backgroundColor) {
        return YES;
    }
    return NO;
}
@end
