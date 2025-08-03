// Debug API calls from browser console
console.log('🔍 Debugging API calls...');

// Test different API URLs
const testUrls = [
  'http://localhost:8080/api/health',
  'http://localhost:8080/health', 
  'http://localhost:4000/api/health'
];

async function testApiUrls() {
  for (const url of testUrls) {
    try {
      console.log(`Testing: ${url}`);
      const response = await fetch(url, {
        method: 'GET',
        headers: {
          'Accept': 'application/json',
        },
        signal: AbortSignal.timeout(5000)
      });
      
      if (response.ok) {
        const data = await response.json();
        console.log(`✅ ${url} - SUCCESS:`, data);
      } else {
        console.log(`❌ ${url} - FAILED: ${response.status}`);
      }
    } catch (error) {
      console.log(`❌ ${url} - ERROR:`, error.message);
    }
  }
}

// Check environment variables
console.log('Environment variables:');
console.log('NEXT_PUBLIC_API_URL:', process.env.NEXT_PUBLIC_API_URL);

// Run tests
testApiUrls();