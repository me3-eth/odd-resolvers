include .env

all: test build

test:; forge test

build:; forge build

deploy-onlytext:; forge create --rpc-url https://eth-ropsten.alchemyapi.io/v2/$(TESTNET_RPC_KEY) --private-key $(WALLET_PK) src/OnlyTextResolver.sol:OnlyTextResolver
