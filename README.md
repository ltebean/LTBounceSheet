# ![LTBounceSheet](https://raw.githubusercontent.com/ltebean/LTBounceSheet/master/demo.gif)

## Usage
```objective-c

// construct the action sheet
self.sheet = [[LTBounceSheet alloc]initWithHeight:250 bgColor:color];

UIButton * option1 = [self productButtonWithTitle:@"take photo"];
option1.frame=CGRectMake(15, 30, 290, 46);
[self.sheet addView:option1];

UIButton * option2 = [self productButtonWithTitle:@"choose existing photo"];
option2.frame=CGRectMake(15, 90, 290, 46);
[self.sheet addView:option2];

UIButton * cancel = [self productButtonWithTitle:@"cancel"];
cancel.frame=CGRectMake(15, 170, 290, 46);
[self.sheet addView:cancel];

[self.view addSubview:self.sheet];


//toggle the sheet
[self.sheet toggle];

```