// https://tutorialedge.net/golang/creating-restful-api-with-golang/
package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"

	// go get -u github.com/gorilla/mux
	"github.com/gorilla/mux"
)

// Article - Our struct for all articles
type Article struct {
	ID          string `json:"id"`
	Title       string `json:"title"`
	Description string `json:"description"`
	Content     string `json:"content"`
}

// Articles is a global Article array.
var Articles []Article

func rootEndpoint(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Welcome to the tool!")
	fmt.Println("Hit rootEndpoint ")
}

func returnAllArticles(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Endpoint Hit: returnAllArticles")
	json.NewEncoder(w).Encode(Articles)
}

func returnSingleArticle(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	key := vars["id"]

	for _, article := range Articles {
		if article.ID == key {
			json.NewEncoder(w).Encode(article)
		}
	}
}

func createArticle(w http.ResponseWriter, r *http.Request) {
	// get the body of our POST request
	// unmarshal this into a new Article struct
	// append this to our Articles array.
	reqBody, _ := ioutil.ReadAll(r.Body)
	var article Article
	json.Unmarshal(reqBody, &article)

	for index, articleItem := range Articles {
		if articleItem.ID == article.ID {
			log.Printf("Article ID [%v] already exist at [%v] index....\n", article.ID, index)
			return
		}
	}

	// update our global Articles array to include
	// our new Article
	Articles = append(Articles, article)

	json.NewEncoder(w).Encode(article)
}

func deleteArticle(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	id := vars["id"]

	for index, article := range Articles {
		if article.ID == id {
			Articles = append(Articles[:index], Articles[index+1:]...)
		}
	}
}

func handleRequests() {
	myRouter := mux.NewRouter().StrictSlash(true)
	myRouter.HandleFunc("/", rootEndpoint)
	myRouter.HandleFunc("/articles", returnAllArticles)
	myRouter.HandleFunc("/article", createArticle).Methods("POST")
	myRouter.HandleFunc("/article/{id}", deleteArticle).Methods("DELETE")
	myRouter.HandleFunc("/article/{id}", returnSingleArticle)
	log.Fatal(http.ListenAndServe(":65535", myRouter))
}

func main() {
	Articles = []Article{
		Article{
			ID:          "1",
			Title:       "Hello One",
			Description: "The description of Article One.",
			Content:     "The content of Article One.",
		},
		Article{
			ID:          "2",
			Title:       "Hello Two",
			Description: "The description of Article Two.",
			Content:     "The content of Article Two.",
		},
	}
	handleRequests()
}
