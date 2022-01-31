// scripts/deployUP_defiSwap.js
const { ethers, upgrades } = require('hardhat');

async function main () {
    const DefiSwap = await ethers.getContractFactory('defiSwap');
    console.log('Deploying defiSwap...');
    const defiSwap = await upgrades.deployProxy(DefiSwap, ['0x03662D8347aC1487e01FCE1CA679e8484ef954a3'], {initializer:'init'});
    await defiSwap.deployed();
    console.log('DefiSwap deployed to:', defiSwap.address);
  }
  
  main();