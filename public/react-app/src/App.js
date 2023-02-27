import './App.css';
import { Routes , Route } from 'react-router-dom'
import Login from './login_form/Login'
import Home from './Home'

function App() {
  return (
    <div className='App'>
      <Routes>
        <Route path="/login" element={<Login/>} />
        <Route index element={<Home/>}  />
      </Routes>
    </div>
  );
}

export default App;
