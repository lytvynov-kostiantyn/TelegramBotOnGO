/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"fmt"
	"github.com/spf13/cobra"
	telebot "gopkg.in/telebot.v3"
	"log"
	"os"
	"time"
)

var (
	botToken = os.Getenv("TELE_TOKEN")
)

// botCmd represents the bot command
var botCmd = &cobra.Command{
	Use:     "bot",
	Aliases: []string{"start"},
	Short:   "A brief description of your command",
	Long: `A longer description that spans multiple lines and likely contains examples
and usage of using your command. For example:

Cobra is a CLI library for Go that empowers applications.
This application is a tool to generate the needed files
to quickly create a Cobra application.`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Printf("bot %s started", appVersion)

		newBot, err := telebot.NewBot(telebot.Settings{
			URL:    "",
			Token:  botToken,
			Poller: &telebot.LongPoller{Timeout: 10 * time.Second},
		})

		if err != nil {
			log.Fatalf("Please check TELE_TOKEN env variable. %s", err)
			return
		}

		newBot.Handle("/start", func(c telebot.Context) error {
			log.Print(c.Message().Payload, c.Text())
			return c.Send(fmt.Sprintf("Hello! I'm KBotOnGo %s!", appVersion))
		})

		newBot.Handle("/help", func(c telebot.Context) error {
			log.Print(c.Message().Payload, c.Text())
			return c.Send("The bot responds to the /start command with a greeting indicating its current version, " +
				"for other messages the user receives an echo.")
		})

		// Echo handler
		newBot.Handle(telebot.OnText, func(m telebot.Context) error {
			log.Print(m.Message().Payload, m.Text())
			return m.Send(m.Text())
		})

		newBot.Start()

	},
}

func init() {
	rootCmd.AddCommand(botCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// botCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// botCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
