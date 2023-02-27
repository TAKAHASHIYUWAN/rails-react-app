import React, { useState } from 'react';
import '../lib/api/http_api'
import './Login.css';


// const postData = async () => {
//   try {
//     const response = await axios.post('http://localhost:3000/api/v1/create', {
//       data: {
//         name: 'John Doe',
//         email: 'john@example.com',
//         password: 'password123'
//       }
//     });
//     console.log(response.data);
//   } catch (error) {
//     console.error(error);
//   }
// };


function Login() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleSubmit = (event) => {
    event.preventDefault();
    console.log(`Email: ${email}, Password: ${password}`);
  };

  return (
    <div className="login">
      <h2>Login</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="email">Email</label>
        <input
          type="email"
          id="email"
          value={email}
          onChange={(event) => setEmail(event.target.value)}
        />

        <label htmlFor="password">Password</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(event) => setPassword(event.target.value)}
        />

        <button type="submit">Login</button>
      </form>
    </div>
  );
}

export default Login;
