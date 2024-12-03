import os

fn cutout(nums []int, i int) []int {
    mut ret := nums[..i].clone()
    if i+1 < nums.len {
        ret << nums[i+1..]
    }
    return ret
}

fn checkup(nums []int) bool {
	for i in 0 .. nums.len {
        cut_nums := cutout(nums, i)
	    if is_safe(cut_nums) {
            return true
        }
    }
    return false
}

fn is_safe(nums []int) bool {
	mut increase := true
	if nums[0] < nums[1] {
		increase = true
	} else {
		increase = false
	}

	for i in 1 .. nums.len {
		if increase {
			if nums[i - 1] >= nums[i] || nums[i] - nums[i - 1] > 3 {
				return false
			}
		} else {
			if nums[i - 1] <= nums[i] || nums[i - 1] - nums[i] > 3 {
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
		} else if checkup(data[i]) {
            safe << data[i]
        }
	}

	println(safe.len)
}
