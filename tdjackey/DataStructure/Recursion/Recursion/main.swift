//
//  main.swift
//  Recursion
//
//  Created by 龚杰 on 1/21/15.
//  Copyright (c) 2015 龚杰. All rights reserved.
//

func printFirstNumbers(N: Int) {
    if N > 1 {
        printFirstNumbers(N - 1)
    }
    println(N)
}

printFirstNumbers(3)