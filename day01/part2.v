module main

import os

fn main() {
	mut left := []int{}
	mut right := []int{}

	for line in os.read_lines('input.txt')! {
		nums := line.split(' ')
		left << nums.first().int()
		right << nums.last().int()
	}

	mut sim := map[int]int{}
	for num in right {
	  sim[num]++
	}

	mut sum := 0
	for num in left {
		sum += num * sim[num]
	}
	println(sum)
}
