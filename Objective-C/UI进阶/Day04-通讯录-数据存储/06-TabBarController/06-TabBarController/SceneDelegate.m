#import "SceneDelegate.h"
#import "RedViewController.h"
#import "GreenViewController.h"
#import "BlueViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    // 创建window
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    
    
    // 初始化tabBarController
    UITabBarController *tabBC = [[UITabBarController alloc] init];
    // 创建并添加3个子控制器
    RedViewController *vc1 = [RedViewController new];
    vc1.view.backgroundColor = UIColor.redColor;
    GreenViewController *vc2 = [GreenViewController new];
    vc2.view.backgroundColor = UIColor.greenColor;
    BlueViewController *vc3 = [BlueViewController new];
    vc3.view.backgroundColor = UIColor.blueColor;
    
    [tabBC addChildViewController:vc1];
    [tabBC addChildViewController:vc2];
    [tabBC addChildViewController:vc3];
    
    vc1.tabBarItem.title = @"最近";
    vc1.tabBarItem.image = [UIImage imageNamed:@"tab_recent_nor"];
    vc2.tabBarItem.title = @"联系人";
    vc2.tabBarItem.image = [UIImage imageNamed:@"tab_buddy_nor"];
    vc3.tabBarItem.title = @"动态";
    vc3.tabBarItem.image = [UIImage imageNamed:@"tab_qworld_nor"];
    
    // badgeValue
    vc1.tabBarItem.badgeValue = @"8888";
    
    
    // 设置window的根控制器
    [self.window setRootViewController:tabBC];
    
    // 显示
    [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
