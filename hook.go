package hooktest

type HookTest struct {
	isTested bool
}

func New() *HookTest {
	return &HookTest{
		isTested: false,
	}
}

func NotTested(a, b int) int {
	if a > b {
		return a
	}

	return b
}

func AlsoNotTested(a, b int) int {
	if b-a > 0 {
		return b
	}

	return a
}
