const axios = require('axios');

// Test backend connectivity and registration
async function testRegistration() {
  console.log('🔍 Testing EventSphere Registration System...\n');

  try {
    // 1. Test health endpoint
    console.log('1. Testing health endpoint...');
    const healthResponse = await axios.get('http://localhost:5000/api/health');
    console.log('✅ Health check:', healthResponse.data.message);
    
    // 2. Test registration with new user
    console.log('\n2. Testing user registration...');
    const testUser = {
      name: 'Debug Test User',
      email: `debug${Date.now()}@example.com`,
      password: 'debug123456'
    };
    
    const registerResponse = await axios.post('http://localhost:5000/api/auth/register', testUser);
    console.log('✅ Registration successful!');
    console.log('User ID:', registerResponse.data.user.id);
    console.log('User Email:', registerResponse.data.user.email);
    console.log('Token received:', registerResponse.data.token ? 'Yes' : 'No');
    
    // 3. Test login with the same user
    console.log('\n3. Testing user login...');
    const loginResponse = await axios.post('http://localhost:5000/api/auth/login', {
      email: testUser.email,
      password: testUser.password
    });
    console.log('✅ Login successful!');
    console.log('Login token received:', loginResponse.data.token ? 'Yes' : 'No');
    
    // 4. Test protected route
    console.log('\n4. Testing protected route...');
    const profileResponse = await axios.get('http://localhost:5000/api/auth/profile', {
      headers: {
        'Authorization': `Bearer ${loginResponse.data.token}`
      }
    });
    console.log('✅ Profile access successful!');
    console.log('Profile name:', profileResponse.data.name);
    
    console.log('\n🎉 ALL TESTS PASSED! Registration system is working correctly.');
    
  } catch (error) {
    console.error('❌ Test failed:', error.response?.data || error.message);
    
    if (error.code === 'ECONNREFUSED') {
      console.log('\n💡 Solution: Make sure the backend server is running');
      console.log('   Run: cd backend && npm start');
    } else if (error.response?.status === 400) {
      console.log('\n💡 This might be a validation error or duplicate user');
    }
  }
}

// Test database connection
async function testDatabase() {
  try {
    const { Sequelize } = require('./backend/config/database');
    const User = require('./backend/models/User');
    
    console.log('\n📊 Testing database connection...');
    await User.count();
    console.log('✅ Database connection working');
    
    const userCount = await User.count();
    console.log(`📈 Total users in database: ${userCount}`);
    
  } catch (error) {
    console.error('❌ Database test failed:', error.message);
    console.log('\n💡 Solution: Make sure XAMPP MySQL is running');
  }
}

// Run tests
async function runAllTests() {
  await testDatabase();
  await testRegistration();
}

runAllTests();
