// scripts/upgrade_defiSwap.js
const { ethers, upgrades } = require('hardhat');

async function main () {
  const DefiSwap = await ethers.getContractFactory('defiSwap');
  console.log('Upgrading defiSwap...');
  await upgrades.upgradeProxy('0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0', DefiSwap);
  console.log('DefiSwap upgraded');
}

main();