import os
import math
import arrays

fn main() {
	mut left := []int{}
	mut right := []int{}
	mut diff := []int{}

	for line in os.read_lines('input.txt')! {
		nums := line.fields().map(it.int())
		left << nums.first()
		right << nums.last()
	}

	left.sort()
	right.sort()

	for i in 0 .. left.len {
		diff << math.abs(left[i] - right[i])
	}

	println(arrays.sum(diff) or {0})
}
