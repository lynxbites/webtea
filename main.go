package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/a-h/templ"
	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"github.com/joho/godotenv"
	comp "github.com/lynxbites/webtea/internal/components"
)

func main() {

	_ = godotenv.Load()

	router := chi.NewRouter()
	router.Use(middleware.Logger)

	router.Get("/", func(w http.ResponseWriter, r *http.Request) {
		templ.Handler(comp.BasicHeader("Hello", comp.Hello())).ServeHTTP(w, r)
	})

	fmt.Printf("server is running on port %s\n", os.Getenv("PORT"))
	err := http.ListenAndServe(":"+os.Getenv("PORT"), router)
	if err != nil {
		fmt.Println(err)
	}
}
