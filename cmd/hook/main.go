package main

import (
	"fmt"

	hooktest "github.com/bombsimon/hook-test"
)

func main() {
	hooktest.New()

	if hooktest.NotTested(1, 2) != 3 {
		fmt.Println("hooky")
	}
}
