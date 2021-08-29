Command + k  在模拟器中调出键盘



## 召回键盘

+ 第一响应者召回 		 [对象 resignFirstResponder];
+ ​          							[self.view endEditing: YES];



UIView 常用属性

frame : 位置和尺寸

center : 中心点位置

@property(nonatomic,readonly) UIView *superview;

获得自己的父控件对象

@property(nonatomic,readonly,copy) NSArray *subviews;

获得自己的所有子控件对象

@property(nonatomic) NSInteger tag;

控件的ID(标识)，父控件可以通过tag来找到对应的子控件

@property(nonatomic) CGAffineTransform transform;控件的形变属性(可以设置旋转角度、比例缩放、平移等属性)

@property(nonatomic) CGRect frame;控件所在矩形框在父控件中的位置和尺寸(以父控件的左上角为坐标原点)可以定义控件的位置(origin)和大小(size)

@property(nonatomic) CGRect bounds;控件所在矩形框的位置和尺寸(以自己左上角为坐标原点，所以bounds的x、y一般为0)可以定义控件的大小(size)

@property(nonatomic) CGPoint center;控件中点的位置(以父控件的左上角为坐标原点)可以定义控件的位置(center)

#### UIView的常见方法

(void)addSubview:(UIView *)view;添加一个子控件view

(void)removeFromSuperview; 从父控件中移除

(UIView *)viewWithTag:(NSInteger)tag; 根据一个tag标识找出对应的控件（一般都是子控件）



#### ButtonUsage

OC对象里有结构体属性时, 不可以直接修改结构体的值. 需要将结构体取出, 修改完之后向对象的结构体重新赋值.

为每个按钮设置不同的tag值, 根据sender.tag 就可以判断哪个按钮被点击了.

# SAND 

