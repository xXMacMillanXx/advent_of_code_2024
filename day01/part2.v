import os

fn main() {
	mut left := []int{}
	mut right := []int{}

	for line in os.read_lines('input.txt')! {
		nums := line.fields().map(it.int())
		left << nums.first()
		right << nums.last()
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
