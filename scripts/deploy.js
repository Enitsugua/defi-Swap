// scripts/deploy.js
async function main () {
    // We get the contract to deploy
    const DefiSwap = await ethers.getContractFactory('defiSwap');
    console.log('Deploying defiSwap...');
    const defiSwap = await DefiSwap.deploy();
    await defiSwap.deployed();
    console.log('DefiSwap deployed to:', defiSwap.address);
    
  }
  
  main()
    .then(() => process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });