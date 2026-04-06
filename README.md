# Ork Hive Fleet Encounter Log

This contract records Ork encounters with Tyranid Hive Fleets, focusing on:

- Hive Fleet identity (Leviathan, Kraken, Behemoth, etc.)
- Creature type faced (Genestealer, Carnifex, Hormagaunt, etc.)
- Evolution or mutation observed
- One-line Ork-style battle summary

These fields are exclusive to Tyranids due to their bioform evolution and hive-mind behavior.

---

## Contract

Deployed on Base:
`0x51776eDD02979B649F443F5F0cC76d737628D86B`

Main file:
`contracts/HiveFleetEncounterLog.sol`

---

## Example encounter

```solidity
recordEncounter(
  "Kraken",
  "Genestealer",
  "Muscle overcharge",
  "Da bugs zipped around too fast, an' da boyz pretended dey planned da retreat."
);

Voting
voteEncounter(1, true);
voteEncounter(1, false);

Tyranid Essence
Tyranids evolve mid-battle, adapt instantly, and attack in coordinated waves guided by the Hive Mind.
This log captures how Orks witness these terrifying bioforms in action.
