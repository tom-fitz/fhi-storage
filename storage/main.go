package main

import (
	"fmt"

	"github.com/tom-fitz/fhi-storage/storage/furniture"
)

func main() {
	output := furniture.Furniture{
		Name: "Test Furniture",
	}
	fmt.Printf("Furniture: %+v \n", output)
}
