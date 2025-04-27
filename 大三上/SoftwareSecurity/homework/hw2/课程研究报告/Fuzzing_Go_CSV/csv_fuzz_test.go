package main

import (
	"strings"
	"testing"
)

// FuzzValidateRecord tests the validateRecord function with fuzzing.
func FuzzValidateRecord(f *testing.F) {
	// Seed corpus with examples, joined as single strings
	f.Add("123,validString")   // valid record
	f.Add("invalidInt,string") // invalid integer
	f.Add("123,")              // invalid string

	f.Fuzz(func(t *testing.T, recordStr string) {
		// Split the string back into a slice
		record := strings.Split(recordStr, ",")

		// Now you can call validateRecord with the slice
		_ = validateRecord(record)
		// Here you can add checks to verify the behavior of validateRecord
	})
}
