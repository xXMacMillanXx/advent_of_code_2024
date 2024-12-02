import os

fn is_safe(nums []int) bool {
	mut increase := true
	if nums[0] < nums[1] {
		increase = true
	} else {
		increase = false
	}

	for i in 1 .. nums.len {
		if increase {
			if nums[i - 1] > nums[i] {
				return false
			}
			if nums[i] - nums[i - 1] > 3 || nums[i] - nums[i - 1] == 0 {
				return false
			}
		} else {
			if nums[i - 1] < nums[i] {
				return false
			}
			if nums[i - 1] - nums[i] > 3 || nums[i - 1] - nums[i] == 0 {
				return false
			}
		}
	}

	return true
}

fn main() {
	mut data := [][]int{}
	mut safe := [][]int{}

	for i, line in os.read_lines('input.txt')! {
		data << line.split(' ').map(it.int())
		if is_safe(data[i]) {
			safe << data[i]
		}
	}

	println(safe.len)
}
