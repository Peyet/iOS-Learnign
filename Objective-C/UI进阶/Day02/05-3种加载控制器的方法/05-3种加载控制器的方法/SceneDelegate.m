#import "SceneDelegate.h"
#import "MyTableViewController.h"
#import "MyXibViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    // 创建窗口
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    
    // 创建controller
//    通过代码创建
//    MyTableViewController *vc = [MyTableViewController new];
//    vc.view.backgroundColor = UIColor.redColor;
    
    // 通过storyboard 创建控制器
        // 1.创建storyboard文件 2.加载storyboard文件中的控制器
//    UIStoryboard *myStoryboard = [UIStoryboard storyboardWithName:@"MyStoryboard" bundle:nil];
//    UIViewController *myVc = [myStoryboard instantiateInitialViewController];
//    UIViewController *myVc = [myStoryboard instantiateViewControllerWithIdentifier:@"blue"];
    
    // 通过xib创建控制器。需要先创建自定义控制器类 ,指定xib文件
//    a. 名称随机
    MyXibViewController *myXibVc = [[MyXibViewController alloc] initWithNibName:@"MyXib" bundle:nil];
//    b. 名称与控制器的类名相似 或者 相同 , 会自己寻找
//        MyXibViewController *myXibVc = [[MyXibViewController alloc] init];
    
    

    
    // 设置rootcontroller
//    self.window.rootViewController = vc;
//    self.window.rootViewController = myVc;
    self.window.rootViewController = myXibVc;

    
    // 设置为可见窗口
    [self.window makeKeyAndVisible];
    
}

// 通过纯代码创建控制器
- (void)code {
    MyTableViewController *vc = [MyTableViewController new];
    vc.view.backgroundColor = UIColor.redColor;

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
