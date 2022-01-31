// scripts/upgrade_defiSwap.js
const { ethers, upgrades } = require('hardhat');

async function main () {
  const DefiSwap = await ethers.getContractFactory('defiSwap');
  console.log('Upgrading defiSwap...');
  await upgrades.upgradeProxy('0x0d0526D25BC1969C37BC8Ce8f58071F004eBd057', DefiSwap);
  console.log('DefiSwap upgraded');
}

main();