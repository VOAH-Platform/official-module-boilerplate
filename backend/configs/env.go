package configs

var Env *MainEnv

type serverEnv struct {
	Port       int
	CSRFOrigin string
	DataDir    string
}

type MainEnv struct {
	Server serverEnv
}
