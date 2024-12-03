module main

import os

fn get_num_str(line string) string {
    mut ret := ''
    mut index := 0
    for line[index] >= `0` && line[index] <= `9` {
        ret += line[index].ascii_str()
        index++
    }
    return ret
}

fn check_mul(line string) int {
    mut a := ''
    mut b := ''
    mut index := 4

    if line[0] == `m` && line[1] == `u` && line[2] == `l` && line[3] == `(` {
        a = get_num_str(line[index..])
        index += a.len
        if line[index] == `,` { index++ } else { return 0 }

        b = get_num_str(line[index..])
        index += b.len
        if line[index] == `)` { index++ } else { return 0 }
    }

    return a.int() * b.int()
}

fn interpret(line string) int {
    mut ret := 0
    for i, letter in line {
        if letter.ascii_str() == 'm' {
            ret += check_mul(line[i..])
        }
    }

    return ret
}

fn part1() !int {
    mut sum := 0
    for line in os.read_lines('input.txt')! {
        sum += interpret(line)
    }
    return sum
}

fn main() {
    result1 := part1()!
    println('part1: ${result1}')
}

