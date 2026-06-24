# CryptoBank — Decentralized Bank Smart Contract
A decentralized bank smart contract built in Solidity that allows multiple users to deposit and withdraw ETH securely, with a configurable maximum balance controlled by an admin.

## Overview

CryptoBank is a smart contract deployed on the Ethereum blockchain that simulates a decentralized bank. It enforces deposit limits, tracks individual user balances, and ensures only the admin can modify the maximum allowed balance.

##  Features
- Multi-user ETH deposit and withdrawal
- Maximum balance restriction per contract (configurable by admin)
- Admin-only access control via custom modifier
- Secure withdrawal pattern using `.call()` to prevent vulnerabilities
- Event emission for deposits and withdrawals
- Balance tracking per user via mapping

##  Tech Stack
- Solidity 0.8.24
- Ethereum
- Remix IDE / VS Code

## Contract Details
| Feature | Detail |
|---|---|
| Language | Solidity 0.8.24 |
| License | LGPL-3.0 |
| Network | Ethereum |
| Pattern | Checks-Effects-Interactions |

## Functions
### depositEther()` — external payable
Allows any user to deposit ETH into the bank. Reverts if the deposit would exceed the maximum balance.

### withdrawEther(uint256 amount_) — external
Allows users to withdraw their previously deposited ETH. Uses the Checks-Effects-Interactions pattern to prevent reentrancy.

### modifyMaxBalance(uint256 newMaxBalance_) — external onlyAdmin
Allows the admin to update the maximum balance allowed in the contract.

### Tecnologías
- Solidity 0.8.24
- Ethereum
- remix.ethereum.org

### Author
**Virginia Villela**  
Blockchain Developer 
