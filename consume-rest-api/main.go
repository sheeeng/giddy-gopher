package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"os"
)

// A Response struct to map the Entire Response
type Response struct {
	Name    string    `json:"name"`
	Pokemon []Pokemon `json:"pokemon_entries"`
}

// A Pokemon Struct to map every Pokémon.
type Pokemon struct {
	EntryNo int            `json:"entry_number"`
	Species PokemonSpecies `json:"pokemon_species"`
}

// PokemonSpecies is a structure to map our Pokémon species which includes its name.
type PokemonSpecies struct {
	Name string `json:"name"`
}

func main() {
	response, err := http.Get("http://pokeapi.co/api/v2/pokedex/kanto/")
	if err != nil {
		fmt.Print(err.Error())
		os.Exit(1)
	}

	responseData, err := ioutil.ReadAll(response.Body)
	if err != nil {
		log.Fatal(err)
	}

	var responseObject Response

	// json.Unmarshal(responseData, &responseObject)
	if err := json.Unmarshal(responseData, &responseObject); err != nil {
		panic(err)
	}

	b, err := json.MarshalIndent(responseObject, "", "  ")
	if err != nil {
		panic(err)
	}

	b2 := append(b, '\n')
	os.Stdout.Write(b2)

	fmt.Println(responseObject)
	fmt.Println(responseObject.Name)
	fmt.Println(len(responseObject.Pokemon))

	for i := 0; i < len(responseObject.Pokemon); i++ {
		fmt.Println(responseObject.Pokemon[i].Species.Name)
	}
}
