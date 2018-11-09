//
//  ViewController.swift
//  GetPoint3
//
//  Created by 財部圭太 on 2018/11/02.
//  Copyright © 2018年 財部圭太. All rights reserved.
//

import UIKit

struct Point {
	var x:Double = 0.0
	var y:Double = 0.0
}

class ViewController: UIViewController {
	let points:[Point] = [Point(x: 42.195,y: 143.123), Point(x: 42.205,y: 143.223),Point(x: 22.195,y: 43.123),Point(x: 124.1876,y: 43.123),Point(x: 4.1876,y: 3.123),Point(x: 524.1876,y: 243.123)]
	let now:Point = Point(x: 42.1999999, y: 143.211)
	var min:Point = Point(x: 0.00, y: 0.00)
	var minPointIndex:Int = 0
	var i:Int = 0
	var getF:Bool = false
	
	var minSqrt:Double = 0
	var nowSqrt:Double = 0
	
	var minSS:Double = 0
	var nowSS:Double = 0
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		for (i,point) in points.enumerated() {
			// ここで2点間の距離を出して小さいものをminへ代入
			// 小さかったらminPointIndexを更新
			if(fabs(point.x-now.x)<10 && fabs(point.y-now.y)<10){
				if(getF==true){
					// 二乗和で比較しないと近いものをスルーしてしまう
					nowSS = Double(fabs(point.x-now.x))*Double(fabs(point.x-now.x))+Double(fabs(point.y-now.y))*Double(fabs(point.y-now.y))
					nowSqrt = sqrt(nowSS)
					if(nowSqrt<minSqrt){
						min.x = point.x
						min.y = point.x
						minPointIndex = i
						minSS = Double(fabs(min.x-now.x))*Double(fabs(min.x-now.x)) + Double(fabs(min.y-now.y))*Double(fabs(min.y-now.y))
						minSqrt = sqrt(minSS)
					}
				}else{
					min.x = point.x
					min.y = point.x
					minPointIndex = i
					getF = true
					minSS = Double(fabs(min.x-now.x))*Double(fabs(min.x-now.x)) + Double(fabs(min.y-now.y))*Double(fabs(min.y-now.y))
					minSqrt = sqrt(minSS)
				}
			}
		}
		
		print(points[minPointIndex])
		
	}
	
	
}


