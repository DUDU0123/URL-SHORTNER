require("dotenv").config();
const express = require('express');
const db = require('./connection.js');
const urlRouter = require('./routes/url.js');
const urlController = require('./controller/url.js')
const app = express();
const PORT = process.env.PORT || 4000;
db.connectDB(process.env.MONGO_URL)
    .then(() => console.log('DB connected'))
    .catch((err) => console.log('DB connection failed', err));

// middleware
app.use(express.json())
app.use(express.urlencoded({extended : false}));
// routes
app.use('/url', urlRouter);

app.get('/url/:shortId',urlController.handleGetOriginalUrlFromShortenedUrl)
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));