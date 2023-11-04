# Assignment - Arrays and Addresses

This assignment focuses on manipulating arrays and using memory addresses as pointers.

## Requirements

There are three arrays defined for you:

```
inputNumbers BYTE 2, 15, 80, 102, 156, 215
outputNumbers WORD 3 DUP (0)
outputAddresses QWORD 3 DUP (0)
```

- The `inputNumbers` array holds six bytes and is pre-initialized with six values.
- The `outputNumbers` array holds three words and is pre-initialized with all zeroes.
- The `outputAddresses` array holds three quad-words and is pre-initialized with all zeroes.

You must populate the `outputNumbers` and `outputAddresses` arrays. The requirements for each are described below.

### 1. Compute the output numbers

Each word value in the `outputNumbers` array must be populated with the sum of two values from the `inputNumbers` array:

- Add the first two input bytes together and store the result in the first element of the output array.
- Add the middle two input bytes together and store the result in the second element of the output array.
- Add the last two input bytes together and store the result in the third element of the output array.

The following C code illustrates the desired behavior:

```
outputNumbers[0] = inputNumbers[0] + inputNumbers[1];
outputNumbers[1] = inputNumbers[2] + inputNumbers[3];
outputNumbers[2] = inputNumbers[4] + inputNumbers[5];
```

Remember, the above code is not assembly code! You must write assembly code that implements that behavior.

The result of each addition must be a word (16 bits). In order to get accurate results, you will need to use the correct register sizes. If you perform addition using 8-bit registers, you risk a result rollover (the max unsigned value for a byte is 255). Once you a 16-bit result, you can copy that value into the appropriate slot in the output array.

### 2. Compute the output addresses

The `outputAddresses` array must be populated with the **addresses** (not the values!) of each output number. A memory address for a 64-bit program is 8 bytes (64 bits).

The following C code illustrates the desired behavior:

```
outputAddresses[0] = &outputNumbers[0];
outputAddresses[1] = &outputNumbers[1];
outputAddresses[2] = &outputNumbers[2];
```

## Notes

### Array indexing

When dealing with arrays in a language like C, you can access elements of the array using an index. For example, `myArray[0]` would get the first element of the array. `myArray[3]` would get the fourth element. The size of each element in the array is automatically taken into consideration by the compiler.

This is not the case in assembly. When accessing elements of an array in assembly, you must know the **byte offset** from the start of the array to the beginning of the element you want to access. For example, consider an array of `DWORD` elements. Each element would be four bytes. To access the fourth element of that array, you would have to offset by 12 bytes (`4 bytes per element * 3 elements skipped = 12 bytes offset`);

### Output code

There is code at the bottom of the `main` function that prints the output numbers to the console. If you build and run the program before adding any of your own code, the program will crash. Why? The `outputAddresses` array is initialized to all zeros, meaning each address is `0`. This is an invalid memory address. The system cannot read from address `0`. You must populate the addresses array with valid memory addresses.
