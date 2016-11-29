# Extension-Swift3.0
some useful Extension for Swift, to develop applications faster

- Int
- Double
- String
- UIButton

# Usage
## UIButton

If we want to put the text and picture position swap，setting the titleEdgeInsets and imageEdgeInsets。

```Swift
   let btn:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 32))
   btn.center = CGPoint(x:view.frame.size.width/2, y:60)
   btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) //文字大小
   btn.setTitleColor(UIColor.orange, for: UIControlState.normal) //文字颜色
   btn.set(image: UIImage(named: "alert"), title: "文字在左侧", titlePosition: .left,
                 spacing: 10.0, state: .normal)
   view.addSubview(btn)
```

![](http://ohdxn33p5.bkt.clouddn.com/Simulator%20Screen%20Shot%202016%E5%B9%B411%E6%9C%8828%E6%97%A5%20%E4%B8%8B%E5%8D%886.07.36.png)