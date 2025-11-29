const axios = require('axios');

const API_URL = process.env.API_URL || 'http://localhost:3150';

const testEmails = [
    // Paraguayos válidos
    'sotelos@santaclara.com.py',
    'admin@gov.py',
    'contacto@mec.gov.py',
    'info@una.py',
    'ventas@itaipu.gov.py',
    'soporte@personal.com.py',
    
    // Paraguayos con posibles problemas
    'usuario@empresa.com.py',
    'test@desconocido.com.py',
    
    // Internacionales válidos
    'user@gmail.com',
    'contact@microsoft.com',
    'admin@amazon.com',
    
    // Inválidos
    'invalid@',
    'sin-arroba.com',
    '@nodomain.com',
    'spaces in@email.com',
    
    // Desechables
    'test@tempmail.com',
    'fake@10minutemail.com'
];

async function testValidation() {
    console.log('═══════════════════════════════════════');
    console.log('   EMAIL VALIDATION TEST SUITE');
    console.log('═══════════════════════════════════════\n');
    
    let passed = 0;
    let failed = 0;
    
    for (const email of testEmails) {
        try {
            const response = await axios.post(`${API_URL}/api/validate-email`, {
                email
            });
            
            const { valid, reason, fromCache } = response.data;
            const cacheIndicator = fromCache ? '📦' : '🔍';
            const statusIcon = valid ? '✓' : '✗';
            const statusColor = valid ? '\x1b[32m' : '\x1b[31m';
            
            console.log(`${cacheIndicator} ${statusColor}${statusIcon}\x1b[0m ${email.padEnd(35)} - ${reason}`);
            
            if (valid) passed++;
            else failed++;
            
        } catch (error) {
            console.error(`❌ ${email.padEnd(35)} - ERROR: ${error.message}`);
            failed++;
        }
    }
    
    console.log('\n═══════════════════════════════════════');
    console.log(`Resultados: ${passed} válidos, ${failed} inválidos/errores`);
    console.log('═══════════════════════════════════════\n');
}

async function testBatchValidation() {
    console.log('Testing batch validation...\n');
    
    try {
        const response = await axios.post(`${API_URL}/api/validate-batch`, {
            emails: testEmails.slice(0, 5)
        });
        
        console.log('Batch validation result:');
        console.log(`Total: ${response.data.total}`);
        console.log(`Valid: ${response.data.valid}`);
        console.log(`Invalid: ${response.data.invalid}\n`);
        
    } catch (error) {
        console.error('Batch validation error:', error.message);
    }
}

async function testHealthAndStats() {
    console.log('Testing health and stats endpoints...\n');
    
    try {
        const health = await axios.get(`${API_URL}/api/health`);
        console.log('Health:', health.data);
        
        const stats = await axios.get(`${API_URL}/api/stats`);
        console.log('Stats:', stats.data);
        console.log('');
        
    } catch (error) {
        console.error('Health/Stats error:', error.message);
    }
}

async function runTests() {
    try {
        await testHealthAndStats();
        await testValidation();
        await testBatchValidation();
        
        console.log('✓ All tests completed\n');
    } catch (error) {
        console.error('Test suite error:', error.message);
    }
}

runTests();