//
//  Scoutable.swift
//  Scoutable
//
//  Created by Jesse Hao on 2018/11/19.
//  Copyright © 2018 Snoware. All rights reserved.
//

/// Scoutable is a wrapper for weak reference which could be an item for weak array.
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
/// Scoutable uses `*` as its instance operator. e.g. let scout = *strongRef
///
/// - Parameter unwrapped: unwrapped strong reference
/// - Returns: weak reference wrapped by Scoutable
prefix func * <T:AnyObject>(_ unwrapped:@autoclosure () -> T?) -> Scoutable<T> {
	return Scoutable<T>(unwrapped())
}

/// You can write code like `let scout = *Object?.self` to create an empty Scoutable weak wrapper quickly.
///
/// - Parameter meta: specific metatype
/// - Returns: empty weak reference wrapper
prefix func * <T:AnyObject>(_ meta:T?.Type) -> Scoutable<T> {
	return Scoutable<T>(nilLiteral: ())
}
