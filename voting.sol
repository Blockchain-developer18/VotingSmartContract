// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Voting {
    address public owner;
    uint public deadline;

    struct Proposal {
        string name;
        uint voteCount;
    }

    Proposal[] public proposals;
    mapping(address => bool) public voted;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner");
        _;
    }

    modifier beforeDeadline() {
        require(block.timestamp < deadline, "Voting time is over");
        _;
    }

    constructor(uint _durationInMinutes) {
        owner = msg.sender;
        deadline = block.timestamp + (_durationInMinutes * 1 minutes);
    }

    function createProposal(string memory _name) public onlyOwner {
        proposals.push(Proposal({name: _name, voteCount: 0}));
    }

    function vote(uint _proposalIndex) public beforeDeadline {
        require(!voted[msg.sender], "You have already voted");
        require(_proposalIndex < proposals.length, "Invalid index");

        proposals[_proposalIndex].voteCount++;
        voted[msg.sender] = true;
    }

    function winningProposal() public view returns (uint winnerIndex) {
        uint highestVotes = 0;
        for (uint i = 0; i < proposals.length; i++) {
            if (proposals[i].voteCount > highestVotes) {
                highestVotes = proposals[i].voteCount;
                winnerIndex = i;
            }
        }
    }

    function getProposal(uint _index) public view returns (string memory name, uint voteCount) {
        require(_index < proposals.length, "Invalid proposal index");
        Proposal memory p = proposals[_index];
        return (p.name, p.voteCount);
    }

    function getTotalProposals() public view returns (uint) {
        return proposals.length;
    }
}
