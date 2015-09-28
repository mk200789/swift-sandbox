// Playground - noun: a place where people can play

import UIKit

//Arrays

var test_array = [16, 25, 13, 47]

print(test_array[3])

print(test_array.count)

//Adding a number to test_array
test_array.append(56)

//Removing an item using the index of array
test_array.removeAtIndex(1)

print(test_array)

/*
In Swift 2 we use,  array.sort()
Since I'm not using Swift two, I'll take note of this
*/

//Here I sort test_array from low - high order
//Note: this will not work with a mixed array type
sort(&test_array) { $0 < $1 }

print(test_array)



var array1 = [3.3, 8, 4.5]

//multiplying two items in array
print(array1[0]*array1[1])

/*
store the results of multiplying two items and
store in array1
*/
array1.append(array1[0]*array1[1])