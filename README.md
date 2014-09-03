# ![LTBounceSheet](https://raw.githubusercontent.com/ltebean/LTBounceSheet/master/demo.gif)

## Usage
```objective-c

// construct the action sheet
self.sheet = [[LTBounceSheet alloc]initWithHeight:250 bgColor:color];

UIButton * option1 = [self produceButtonWithTitle:@"take photo"];
option1.frame=CGRectMake(15, 30, 290, 46);
[self.sheet addView:option1];

UIButton * option2 = [self produceButtonWithTitle:@"choose existing photo"];
option2.frame=CGRectMake(15, 90, 290, 46);
[self.sheet addView:option2];

UIButton * cancel = [self produceButtonWithTitle:@"cancel"];
cancel.frame=CGRectMake(15, 170, 290, 46);
[self.sheet addView:cancel];

[self.view addSubview:self.sheet];


//toggle the sheet
[self.sheet toggle];

```