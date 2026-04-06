// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Tyranid Hive Fleet Encounter Log
/// @notice Records Ork encounters with Tyranid hive fleets and their evolving bioforms.
/// @dev Unique to Tyranids due to hive fleet, bioform, and evolution fields.

contract HiveFleetEncounterLog {

    address constant EXAMPLE_ADDRESS = 0x0000000000000000000000000000000000000001;

    struct Encounter {
        string hiveFleet;       // Leviathan, Kraken, Behemoth, etc.
        string creatureType;    // Genestealer, Carnifex, Hormagaunt, etc.
        string evolutionShift;  // Mutation or adaptation observed
        string battleSummary;   // One-line summary of battle + result
        address creator;
        uint256 approved;
        uint256 rejected;
        uint256 createdAt;
    }

    Encounter[] public logs;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event EncounterRecorded(uint256 indexed id, string hiveFleet, address indexed creator);
    event EncounterVoted(uint256 indexed id, bool approved, uint256 approvedVotes, uint256 rejectedVotes);

    constructor() {
        logs.push(
            Encounter({
                hiveFleet: "Example Hive Fleet (Fill your own below)",
                creatureType: "Example creature",
                evolutionShift: "Example mutation",
                battleSummary: "Example battle summary.",
                creator: EXAMPLE_ADDRESS,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );
    }

    function recordEncounter(
        string calldata hiveFleet,
        string calldata creatureType,
        string calldata evolutionShift,
        string calldata battleSummary
    ) external {
        require(bytes(hiveFleet).length > 0, "Hive fleet required");

        logs.push(
            Encounter({
                hiveFleet: hiveFleet,
                creatureType: creatureType,
                evolutionShift: evolutionShift,
                battleSummary: battleSummary,
                creator: msg.sender,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );

        emit EncounterRecorded(logs.length - 1, hiveFleet, msg.sender);
    }

    function voteEncounter(uint256 id, bool approved) external {
        require(id < logs.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        Encounter storage e = logs[id];

        if (approved) {
            e.approved += 1;
        } else {
            e.rejected += 1;
        }

        emit EncounterVoted(id, approved, e.approved, e.rejected);
    }

    function totalEncounters() external view returns (uint256) {
        return logs.length;
    }
}
