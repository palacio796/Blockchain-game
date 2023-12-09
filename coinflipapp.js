//app
const express = require('express');
const path = require('path');
const Web3 = require('web3');
const app = express();

//port
let PORT = 3000;

// serve static files from public folder
app.use(express.static('public'));

// Serve the HTML file wehn someone accesses the root endpoint
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

//start the server

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});

