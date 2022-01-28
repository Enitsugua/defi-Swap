// scripts/deploy.js
async function main () {
    // We get the contract to deploy
    const DefiSwap = await ethers.getContractFactory('defiSwap');
    console.log('Deploying defiSwap...');
    const defiSwap = await DefiSwap.deploy('0x03662D8347aC1487e01FCE1CA679e8484ef954a3');
    await defiSwap.deployed();
    console.log('DefiSwap deployed to:', defiSwap.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });