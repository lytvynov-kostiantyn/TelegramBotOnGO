package cmd

import (
	"fmt"
	"os"
)

var (
	TeleToken = os.Getenv("TELE_TOKEN")
)

func init() {
	fmt.Println(TeleToken)
}
