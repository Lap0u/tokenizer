Ce token sera deployé sur la blochain de test BNB Smart chain test. Pour cela, il faut installer l'extension [Metamask](https://metamask.io/) et se connecter à la blockchain de test BNB Smart chain test.

Avant tout, il faut obtenir des crédits sur la blockchain de test BNB Smart chain test. Pour cela, il faut se rendre sur le faucet de votre choix, par exemple [BNB Faucet](https://www.bnbchain.org/en/testnet-faucet) et entrer son adresse Metamask. (limité à 0.3 BNB par jour)
Pour deployer le smart contract, il faut se rendre sur [Remix](https://remix.ethereum.org/). Il faut ensuite créer un nouveau fichier solidity dans le dossier contracts, par exemple "token.sol" et copier le code du smart contract dans ce fichier. Il faut ensuite sélectionner l'onglet de compilation et compiler le smart contract en cliquant sur le bouton `compile`. Il faut ensuite cliquer sur l'onglet `deploy & run transactions` et choisir l'environnement `Injected provider Metamask`. Il faut bien sélectionner le nouveau smart contract : The Answer Coin. Il faut ensuite cliquer sur le bouton `deploy` pour deployer le smart contract puis confirmer la transaction sur Metamask.
Le token est maintenant deployé sur la blockchain de test BNB Smart chain test.
Pour le vérifier, il faut se rendre sur [BscScan](https://testnet.bscscan.com/) et entrer l'adresse du smart contract (que l'on peut trouver tout en bas dans deployed contracts ) dans la barre de recherche. Il est possible de voir les informations du smart contract, comme le nom, le symbole, le total supply, etc.
Pour interagir avec le smart contract, il faut revenir sur Remix et nous pouvons utiliser les différentes méthodes du smart contract, comme `transfer`, `balanceOf`, `totalSupply`, etc.
L'historique de ces opérations sera visible sur BscScan.

Dernier contrat de test en date : 0x58e2bA208c5DBEdF099ddE05Fa4Dc8cA6A425a04 : [BSC scan](https://testnet.bscscan.com/address/0x58e2bA208c5DBEdF099ddE05Fa4Dc8cA6A425a04) (scanner pour la blockchain BNB Smart chain test)

Vous pouvez ensuite ajouter ce token à votre wallet Metamask en cliquant sur `add token` puis en entrant l'adresse du smart contract. Vous pourrez alors voir votre balance de 42 The Answer Coin dans votre wallet Metamask.
