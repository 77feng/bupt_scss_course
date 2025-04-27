package main

import (
	"testing"
	"unicode/utf8"
)

// FuzzReverseString tests the ReverseString function with fuzzing.
func FuzzReverseString(f *testing.F) {
	f.Add("hello")
	f.Add("world")
	f.Add("你好") // "Hello" in Chinese

	f.Fuzz(func(t *testing.T, original string) {
		// Check if the original string is valid UTF-8
		if !utf8.ValidString(original) {
			t.Skip("Skipping invalid UTF-8 string")
		}

		reversed := ReverseString(original)
		doubleReversed := ReverseString(reversed)
		if original != doubleReversed {
			t.Errorf("Double reversing '%s' did not give original string, got '%s'", original, doubleReversed)
		}

		if utf8.RuneCountInString(original) != utf8.RuneCountInString(reversed) {
			t.Errorf("The length of the original and reversed string does not match for '%s'", original)
		}
	})
}
