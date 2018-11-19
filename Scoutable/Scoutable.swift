//
//  Scoutable.swift
//  Scoutable
//
//  Created by Jesse Hao on 2018/11/19.
//  Copyright © 2018 Snoware. All rights reserved.
//

struct Scoutable<T:AnyObject> {
	weak var value:T?
	init(_ value: T?) {
		self.value = value
	}
}

extension Scoutable : ExpressibleByNilLiteral {
	init(nilLiteral: ()) { self.value = nil }
}

prefix operator *
prefix func * <T:AnyObject>(_ unwrapped:@autoclosure () -> T?) -> Scoutable<T> {
	return Scoutable<T>(unwrapped())
}

prefix func * <T:AnyObject>(_ meta:T?.Type) -> Scoutable<T> {
	return Scoutable<T>(nilLiteral: ())
}
