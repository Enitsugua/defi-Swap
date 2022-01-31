// scripts/index.js
async function main () {
// Retrieve accounts from the local node
const accounts = await ethers.provider.listAccounts();
//console.log(accounts);
//Capture contract instance
const address = '0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512';
const DefySwap = await ethers.getContractFactory('defiSwap');
const defiSwap = await DefySwap.attach(address);

// const value = await defiSwap.getNumber();
// console.log('Defi number is', value.toString());
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });