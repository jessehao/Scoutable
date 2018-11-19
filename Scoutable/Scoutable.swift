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
