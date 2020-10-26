# nigiri-travis
Travis template for adding 🍣 [Nigiri Bitcoin](https://nigiri.vulpem.com) to your CI pipeline. 



## Installer
You can spin up a `regtest` development box in any Travis pipeline by running

```sh
curl https://travis.nigiri.network | bash
```

> NOTICE: You'll need to enable **docker** 


## Example for Travis

Create a `.travis.yml` in your root folder and add the installer script in the `before_install` step

```yaml
services:
  - docker
 
before_install:
  - curl https://travis.nigiri.network | bash
  
install:
  - docker-compose up -d

script:
  - docker ps -a
  # Get all blocks in Bitcoin
  - curl http://localhost:3000/blocks
  # Get the current block height in Liquid
  - curl http://localhost:3001//blocks/tip/height
  # Get some Liquid Bitcoins with faucet
  - curl -X POST --data '{"address":"2MsnWskyHaHvcZUHA4gnR3G95EnUmZQjzM8"}' http://localhost:3001/faucet`
  # Push raw TX with automatic mining
  - curl -X POST --data `xxx` http://localhost:3001/tx`

after_script:
  - docker-compose down
```

## Example for Github Action

```yaml
name: Nigiri pipeline

on:
  push:
    branches: [master]
  pull_request:
    branches: [master]

jobs:
  integration:
    name: Integration Tests
    runs-on: ubuntu-latest
    steps:

      - name: Install Nigiri
        run: |
          mkdir ~/.nigiri; cd ~/.nigiri
          curl https://travis.nigiri.network | bash; cd
          docker-compose -f ~/.nigiri/docker-compose.yml up -d


```

## Services


* Electrs
  * REST `localhost:3000`
  * Faucet `localhost:3000/faucet`

* Electrs for Liquid 
  * REST `localhost:3001`
  * Faucet `localhost:3001/faucet`


* Bitcoin 
  * RPC host:port `localhost:18443`
  * RPC user `admin1`
  * RPC password `123`

* Liquid 
  * RPC host:port `localhost:18884`
  * RPC user `admin1`
  * RPC password `123`



Full documentation of  [Electrs REST API](https://github.com/Blockstream/esplora/blob/master/API.md)



