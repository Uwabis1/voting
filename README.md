# voting
ballot box voting system for multiple users
In other to save gas we use bytes32 instead of string to save Proposal (what is inteded to be voted on: bytes are the basic units of measurement of information in computer processing
Strings » Bytes32String » ethers.utils.formatBytes32String Returns a bytes32 string representation of text. So we can convert this and use in place of the string.
This is done using nodes.js / The Ethers Project

/*to run command, open terminal and run; node createBytes.js <stringname>, this 
will give u the convertion in Bytes...e.g: node createBytes.js paul.usembo
to convert the Bytes back to strings; run node parseBtyes.js <Unicode> on the terminal. 
but first you need to icd into the directory of the root folder, then nitialize npm: npm init --y 
npm is a nodes libary manager which allows you to install libraries. 
This helps bring in a libarary called ehters (search npm Ethers for more details on this)
Then run npm i ethers. 
*/
