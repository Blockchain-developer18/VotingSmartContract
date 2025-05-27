# 🗳️ Voting Smart Contract (Solidity)

This is a simple **Voting Smart Contract** built using Solidity. It allows an owner to create multiple proposals, and users can vote for their favorite proposal. Voting is only allowed once per user and only before a specified deadline.

---

## 🚀 Features

- Owner can create proposals.
- Users can vote once for any proposal.
- Votes are only counted before the deadline.
- Anyone can check:
  - Total proposals
  - Details of each proposal
  - The winning proposal index

---

## 🔧 Smart Contract Details

- **Language**: Solidity `^0.8.18`
- **License**: MIT

### 🧱 Structs
- `Proposal`: Stores `name` and `voteCount`.

### 🧮 State Variables
- `owner`: Address of the contract deployer.
- `deadline`: Voting end time.
- `proposals[]`: Array of all proposals.
- `voted`: Mapping to track who has already voted.

---

## 🛠️ Functions

| Function | Access | Description |
|---------|--------|-------------|
| `createProposal(string memory name)` | onlyOwner | Add a new proposal |
| `vote(uint index)` | public | Vote for a proposal |
| `winningProposal()` | public view | Get the index of the winning proposal |
| `getProposal(uint index)` | public view | View name and vote count |
| `getTotalProposals()` | public view | View number of proposals |

---

## 📦 Deployment

1. Open [Remix IDE](https://remix.ethereum.org).
2. Paste the contract code.
3. Compile using Solidity version `0.8.18`.
4. Deploy the contract with a voting duration in minutes.
5. Use different accounts to vote and test.

---

## 📜 License

This project is licensed under the MIT License.
