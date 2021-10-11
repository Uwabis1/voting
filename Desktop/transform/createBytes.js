const ethers = require('ethers'); 

async function createBytes(args){
    const name = args[0]; 
    const bytes = ethers.utils.formatBytes32String(name);
    console.log('name: ',bytes);
}

createBytes(process.argv.slice(2)); 


/*to run command, open terminal and run; node createBytes.js <stringname>, this 
will give u the convertion in Bytes...e.g: node createBytes.js paul.usembo
to convert the Bytes back to strings; run node parseBtyes.js <Unicode> on the terminal. 

but first you need to icd into the directory of the root folder, then nitialize npm: npm init --y 
npm is a nodes libary manager which allows you to install libraries. 
This helps bring in a libarary called ehters (search npm Ethers for more details on this)
Then run npm i ethers. 
*/

