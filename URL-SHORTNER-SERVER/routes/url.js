const express = require('express');
const urlController = require('../controller/url')
const router = express.Router();

router.post('/', urlController.handleGenerateNewShortURL);
router.get('/analytics/:shortId', urlController.handleGetAnalytics);
module.exports = router;