package main

import (
	"encoding/csv"
	"fmt"
	"io"
	"os"
	"strconv"
)

// validateAndSaveData reads CSV data from an io.Reader, validates it, and saves valid rows to a file.
func validateAndSaveData(r io.Reader, outputFile string) error {
	csvReader := csv.NewReader(r)
	validData := [][]string{}

	for {
		record, err := csvReader.Read()
		if err == io.EOF {
			break
		}
		if err != nil {
			return fmt.Errorf("error reading CSV data: %w", err)
		}

		if validateRecord(record) {
			validData = append(validData, record)
		}
	}

	return saveValidData(validData, outputFile)
}

// validateRecord checks if a CSV record is valid. For simplicity, let's assume the first column should be an integer and the second a non-empty string.
func validateRecord(record []string) bool {
	if len(record) != 2 {
		return false
	}

	if _, err := strconv.Atoi(record[0]); err != nil {
		return false
	}

	if record[1] == "" {
		return false
	}

	return true
}

// saveValidData writes the validated data to a file.
func saveValidData(data [][]string, outputFile string) error {
	file, err := os.Create(outputFile)
	if err != nil {
		return fmt.Errorf("error creating output file: %w", err)
	}
	defer file.Close()

	csvWriter := csv.NewWriter(file)
	for _, record := range data {
		if err := csvWriter.Write(record); err != nil {
			return fmt.Errorf("error writing record to file: %w", err)
		}
	}
	csvWriter.Flush()
	return csvWriter.Error()
}
