module main

import os
import math

fn main() {
	mut left := []int{}
	mut right := []int{}
	mut diff := []int{}

	for line in os.read_lines('input.txt')! {
		nums := line.split(' ')
		left << nums.first().int()
		right << nums.last().int()
	}

	left.sort()
	right.sort()

	for i in 0 .. left.len {
		diff << math.abs(left[i] - right[i])
	}

	mut sum := 0
	for num in diff {
		sum += num
	}
	println(sum)
}
