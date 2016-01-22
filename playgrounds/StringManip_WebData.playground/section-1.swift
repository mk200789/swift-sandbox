// Playground - noun: a place where people can play

import UIKit

var str = "Hello "

//combining two strings
var newString = str + "Kim"

//splitting strings: going through each character of the string
for character in newString{
    print(character)
}

//newTypeString is a NSString of newString
var newTypeString = NSString(string: newString)

//using NSString available functions we can get substrings

//get substring from 6
newTypeString.substringFromIndex(6)

//get substring till index 5 (but not including 5)
newTypeString.substringToIndex(5)

//get substring of range starting at index 3 of length 5
newTypeString.substringWithRange(NSRange(location: 3, length: 5))

//check if string contains a substring
if newTypeString.containsString("Kim"){
    print("Contains Kim!")
}
else{
    print("no")
}

//split string by space, returns an array of the splitted components
newTypeString.componentsSeparatedByString(" ")

//set all uppercase
newTypeString.uppercaseString

//set all lowercase
newTypeString.lowercaseString