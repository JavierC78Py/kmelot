// server.js - Express backend
const express = require('express');
const { validate } = require('deep-email-validator');

const app = express();
app.use(express.json());

app.post('/api/validate-email', async (req, res) => {
    try {
        const { email } = req.body;
        
        const result = await validate({
            email: email,
            validateRegex: true,
            validateMx: true,
            validateSmtp: true,
            validateDisposable: true
        });
        
        res.json({
            valid: result.valid,
            reason: result.reason,
            email: email
        });
    } catch (error) {
        res.status(500).json({
            valid: false,
            error: error.message
        });
    }
});

app.listen(3150, () => console.log('API running on port 3150'));
