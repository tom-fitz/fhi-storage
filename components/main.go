package main

import (
	"fmt"
	"storage/furniture"
)

func main() {
	output := furniture.Furniture{
		Name: "Test Furniture",
	}
	fmt.Printf("Furniture: %+v \n", output)
}
