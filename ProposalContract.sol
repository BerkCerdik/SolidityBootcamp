// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ProposalContract {
    uint256 public proposalCount;

    struct Proposal {
        uint256 id;
        string title; // Yeni eklenen başlık alanı
        string description;
        uint256 approve;
        uint256 reject;
        uint256 pass;
        uint256 total_vote_to_end;
        bool current_state;
        bool is_active;
    }

    mapping(uint256 => Proposal) proposal_history;

    // Constructor
    constructor() {
        proposalCount = 0;
    }

    // Yeni öneri oluşturmak için fonksiyon
    function createProposal(string memory _title, string memory _description, uint256 _totalVoteToEnd) public {
        proposalCount++;
        uint256 proposalId = proposalCount;
        Proposal storage newProposal = proposal_history[proposalId];
        newProposal.id = proposalId;
        newProposal.title = _title; // Yeni eklenen başlık alanı
        newProposal.description = _description;
        newProposal.total_vote_to_end = _totalVoteToEnd;
        newProposal.is_active = true;
    }
}
