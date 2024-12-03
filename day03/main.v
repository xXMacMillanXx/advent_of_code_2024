module main

import os

enum DoState {
    do
    dont
    no
}

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

fn check_do_state(line string) DoState {
    if line[0] == `d` && line[1] == `o` && line[2] == `n` && line[3] == `'` && line[4] == `t` && line[5] == `(` && line[6] == `)` {
        return .dont
    }
    if line[0] == `d` && line[1] == `o` && line[2] == `(` && line[3] == `)` {
        return .do
    }
    return .no
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

fn interpret_2(line string, mut enabled []bool) int {
    mut ret := 0
    for i, letter in line {
        if enabled[0] && letter.ascii_str() == 'm' {
            ret += check_mul(line[i..])
        }
        if letter.ascii_str() == 'd' {
            match check_do_state(line[i..]) {
                .do { enabled[0] = true }
                .dont { enabled[0] = false }
                else {}
            }
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

fn part2() !int {
    mut sum := 0
    mut enabled := [true] // why is this an array? because mutable parameters don't work on primitive types anymore...
    for line in os.read_lines('input.txt')! {
        sum += interpret_2(line, mut enabled)
    }
    return sum
}

fn main() {
    result1 := part1()!
    println('part1: ${result1}')
    result2 := part2()!
    println('part2: ${result2}')
}

