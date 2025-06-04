package main

import (
	"log"
	"os"
	"time"

	tele "gopkg.in/telebot.v3"
)

var version = "dev" // Значення підставляється через -ldflags при збірці

func main() {
	token := os.Getenv("TELE_TOKEN")
	if token == "" {
		log.Fatal("TELE_TOKEN is not set")
	}

	pref := tele.Settings{
		Token:  token,
		Poller: &tele.LongPoller{Timeout: 10 * time.Second},
	}

	bot, err := tele.NewBot(pref)
	if err != nil {
		log.Fatal(err)
	}

	bot.Handle(tele.OnText, func(c tele.Context) error {
		return c.Send("Ти написав: " + c.Text())
	})

	log.Printf("Бот запущено... Версія: %s\n", version)
	bot.Start()
}

