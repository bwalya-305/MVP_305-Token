# 🪙 MvpToken (ERC-20)

A professional ERC-20 token implementation built with **Foundry**, featuring automated deployment scripts and GitHub Actions integration. This project was developed as part of a Web3 development journey to master the Foundry toolkit and Ethereum standards.

## 🚀 Overview

**MvpToken** is a standard ERC-20 token deployed on the **Ethereum Sepolia Testnet**. It leverages the industry-standard OpenZeppelin libraries to ensure security and compatibility with wallets like MetaMask and decentralized exchanges.

* **Token Name:** Mvp Token
* **Symbol:** MVP
* **Decimals:** 18
* **Initial Supply:** 1,000,000 MVP

---

## 🛠 Tech Stack

* **Smart Contract:** Solidity `^0.8.20`
* **Framework:** [Foundry](https://book.getfoundry.sh/) (Forge & Cast)
* **Library:** [OpenZeppelin Contracts](https://openzeppelin.com/contracts/)
* **Network:** Ethereum Sepolia Testnet
* **CI/CD:** GitHub Actions (Forge Format & Test)

---

## 📂 Project Structure

```text
.
├── src/                # Smart contract source code
│   └── MvpToken.sol    # The ERC-20 Token contract
├── script/             # Deployment and interaction scripts
│   └── DeployMvpToken.s.sol
├── test/               # Unit and Integration tests
├── .github/workflows/  # Automated CI/CD (linting/testing)
├── .env                # Environment variables (Private Keys, RPC URLs)
└── foundry.toml        # Foundry configuration file