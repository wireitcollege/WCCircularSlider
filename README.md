# WCCircularSlider
The WCCircularSlider is a great tool to present percentage based information in an elegant and simple way. The default appearance conforms to the beautiful flat design and the center space can be personalized with custom views.
![alt tag](https://wireitcollege.binpress.com/images/stores/store41569/screen-shot-2015-09-07-at-12.37.28-pm1.png)
## Installation

### Using CocoaPods

```
platform :ios, '5.0'
pod 'WCCircularSlider', '~> 0.0.2'
```

### Manual

Add all files from the Classes folder to your project
Import as usual: #import "WCCircularSlider.h"

## Setup

WCCircularSlider can be added to your view either from the Interface Builder or through code.

#### Interface Builder (Xcode 5):

* Open the Storyboard or Xib file you want to add the pie chart to.
* Drag a new UIView from the Object Library into your view controller.
* Resize and position your new UIView as you wish (the pie chart will be drawn on the center of the new UIView).
* Make sure the new UIView is selected and choose the Identity Inspector tab on Xcode's the Utilities view (on the right).
* Change the class from UIView to WCCircularSlider.
* On the view controller's header file create an IBOutlet property of the type WCCircularSlider and link it to the object you created on the Interface Builder.

#### Through Code:
```
CGRect frame = CGRectMake(x, y, width, height);
WCCircularSlider *slider = [[WCCircularSlider alloc] initWithFrame:frame];
[self.view addSubview:slider];
```

## Example Usage
```
self.slider.lineWidth = 10.f;
self.slider.startAngle = -90.f;
self.slider.cutoutAngle = 90.f;
self.slider.progress = 0.42f;

self.slider.tintColor = [UIColor blackColor];
self.slider.guideLineColor = [UIColor lightGrayColor];

[self.slider addTarget:self action:@selector(didValueChanged:) forControlEvents:UIControlEventValueChanged];
```

Producted by [Wire IT College](http://wire.org.ua)
