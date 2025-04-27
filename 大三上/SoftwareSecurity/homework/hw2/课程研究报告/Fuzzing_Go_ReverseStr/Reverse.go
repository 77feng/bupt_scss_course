package main

// ReverseString takes a string as input and returns its reverse.
func ReverseString(s string) string {
	// Convert the string to a rune slice to properly handle multi-byte characters.
	runes := []rune(s)
	for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
		// Swap the runes.
		runes[i], runes[j] = runes[j], runes[i]
	}
	// Convert the rune slice back to a string and return it.
	return string(runes)
}
