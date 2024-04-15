Ce token sera deployé sur la blochain de test BNB Smart chain test. Pour cela, il faut installer l'extension [Metamask](https://metamask.io/) et se connecter à la blockchain de test BNB Smart chain test.

Avant tout, il faut obtenir des crédits sur la blockchain de test BNB Smart chain test. Pour cela, il faut se rendre sur le faucet de votre choix, par exemple [BNB Faucet](https://www.bnbchain.org/en/testnet-faucet) et entrer son adresse Metamask. (limité à 0.3 BNB par jour)
Pour deployer le smart contract, il faut se rendre sur [Remix](https://remix.ethereum.org/). Il faut ensuite créer un nouveau fichier solidity, par exemple "token.sol" et copier le code du smart contract dans ce fichier. Il faut ensuite compiler le smart contract en cliquant sur le bouton `compile` en haut à gauche. Il faut ensuite cliquer sur l'onglet `deploy & run transactions` et choisir l'environnement `Injected Web3`. Il faut ensuite cliquer sur le bouton `deploy` pour deployer le smart contract. Il faut ensuite confirmer la transaction sur Metamask.
Le token est maintenant deployé sur la blockchain de test BNB Smart chain test.
Pour le vérifier, il faut se rendre sur [BscScan](https://testnet.bscscan.com/) et entrer l'adresse du smart contract dans la barre de recherche. Il est possible de voir les informations du smart contract, comme le nom, le symbole, le total supply, etc.
Pour interagir avec le smart contract, il faut revenir sur Remix et nous pouvons utiliser les différentes méthodes du smart contract, comme `transfer`, `balanceOf`, `totalSupply`, etc.
L'historique de ces opérations sera visible sur BscScan.

Contract address 0x07EaE76399ccBADA678d8e9b9665D8821B03620D : [Sepolia](https://sepolia.etherscan.io/) (scanner)
