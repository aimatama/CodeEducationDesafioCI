package main

import "testing"

func TestSoma(t *testing.T) {
	result := Soma(5, 5)
	if result != 10 {
		t.Errorf("O resultado da soma %d; não é igual a 10 conforme o esperado.", result)
	}
}