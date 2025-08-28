+++
title = 'Checking Bits with Bitwise Operators'
date = 2025-08-28
draft = false
+++

Recently I created a [project](https://binary-animation.unbounddev.dev) that was an animation using lights to show the conversion between decimal to binary. While creating this project I came across an interesting method of checking the value of the individual bits of a decimal number. I needed the value of the individual bits in order to know whether each light should be turned on or off. I used two different bitwise operators in my project and will cover these operators below.

## The bitwise AND (&) operator 

The bitwise AND (&) operator allows us to see all of the bits that have a value of 1 in both operands. The result of the bitwise AND (&) operator is a new decimal number whose binary value has a 1 in each bit position where both operands had a value of 1. Lets take a look at a short example below.

```javascript
const a = 1; // 0001
const b = 5; // 0101
console.log(a & b); // 1 aka 0001

// 0001 = 1
// 0101 = 5
// ----
// 0001 = 1
```

**Truth table for the AND operation**

|x|y|x AND y|
|-|-|-|
|0|0|0|
|0|1|0|
|1|0|0|
|1|1|1|

## The bitwise left shift (\<\<) operator

The bitwise left shift operator results in a number where all of the bits of the left operand are shifted left by the specified number of bits. Zero bits are shifted in from the right, and excess bits shifted off to the left are discarded.

```javascript
const a = 3; // 0011
const b = 2; // 0010
console.log(a << b); // 1100 aka 12

// 0011 = 3
// 1100 = 3 << 2 = 12
```

## Combining left shift (\<\<) and AND (&) to check a specific bit position value

Since we know that we can use the bitwise AND (&) operator to check which bit positions of two numbers both have the value 1, we can use the bitwise left shift (\<\<) operator to create a number that has the value 1 in a specific position, when compared to the first number this will result in a value of 0 or some other number. If we get a value other than 0 we know that the specified bit position has a 1 in it. Since 0 is false in JavaScript and every other number is true, we can use the logic explained above in a conditional expression to test whether the value of the bit position is 1. Let's walk through an example below where we walk through 8 bit positions.

```javascript
let num = 220;
for (let i = 0; i < 8; i++){
    console.log((num & (1 << i)) ? "1" : "0");
}

// i = 0
// num = 220 = 11011100
// (1 << 0) =  00000001
// --------------------
//             00000000 = 0 (false)

// i = 1
// num = 220 = 11011100
// (1 << 1) =  00000010
// --------------------
//             00000000 = 0 (false)

// i = 2
// num = 220 = 11011100
// (1 << 2) =  00000100
// --------------------
//             00000100 = 4 (true)

// i = 3
// num = 220 = 11011100
// (1 << 3) =  00001000
// --------------------
//             00001000 = 8 (true)

// i = 4
// num = 220 = 11011100
// (1 << 4) =  00010000
// --------------------
//             00010000 = 16 (true)

// i = 5
// num = 220 = 11011100
// (1 << 5) =  00100000
// --------------------
//             00000000 = 0 (false)

// i = 6
// num = 220 = 11011100
// (1 << 6) =  01000000
// --------------------
//             01000000 = 64 (true)

// i = 7
// num = 220 = 11011100
// (1 << 7) =  10000000
// --------------------
//             10000000 = 128 (true)
```

