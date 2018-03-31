package hooktest

import "testing"

func TestNew(t *testing.T) {
	h := New()

	if h == nil {
		t.Error("Expected a pointer.")
	}
}
