const ethers = require('ethers');
const { message } = require('./entries.js');

const utfMessage = ethers.utils.toUtf8Bytes(message);
const hash = ethers.utils.sha256(utfMessage);

console.log(hash);
